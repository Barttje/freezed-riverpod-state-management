import 'package:freezed_riverpod_state/model/FinishedState.dart';
import 'package:freezed_riverpod_state/model/GameState.dart';
import 'package:freezed_riverpod_state/model/PlayerType.dart';
import 'package:freezed_riverpod_state/model/Progress.dart';
import 'package:freezed_riverpod_state/model/Tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier(GameState state) : super(state) {
    Map<Tile, PlayerType> tiles = Map<Tile, PlayerType>();
    for (int x = 0; x < 3; x++) {
      for (int y = 0; y < 3; y++) {
        tiles.putIfAbsent(Tile(x, y), () => PlayerType.EMPTY);
      }
    }
    this.state = state.copyWith(tiles: tiles, progress: Progress.inProgress());
  }

  toggle(Tile tile) {
    state.tiles[tile] = state.currentPlayer;
    state = state.copyWith(
      currentPlayer: _nextPlayer(),
      progress: _determineProgress(),
      tiles: state.tiles.map((key, value) => MapEntry(key, value)),
    );
  }

  reset() {
    state = state.copyWith(
        currentPlayer: PlayerType.CIRCLE,
        progress: Progress.inProgress(),
        tiles:
            state.tiles.map((key, value) => MapEntry(key, PlayerType.EMPTY)));
  }

  Progress _determineProgress() {
    var finished = isFinished();
    if (finished == null) {
      return state.progress;
    }
    return Progress.finished(finished);
  }

  PlayerType _nextPlayer() {
    if (state.currentPlayer == PlayerType.CIRCLE) {
      return PlayerType.CROSS;
    }
    return PlayerType.CIRCLE;
  }

  FinishedState? isFinished() {
    if (_hasThreeInARow(PlayerType.CIRCLE)) {
      return FinishedState.CIRCLE;
    }
    if (_hasThreeInARow(PlayerType.CROSS)) {
      return FinishedState.CROSS;
    }
    if (state.tiles.entries
            .where((element) => element.value == PlayerType.EMPTY)
            .toList()
            .length ==
        0) {
      return FinishedState.DRAW;
    }
    return null;
  }

  bool _hasThreeInARow(PlayerType player) {
    var tiles = state.tiles.entries
        .where((element) => element.value == player)
        .map((e) => e.key)
        .toList();

    if (tiles.where((element) => element.y == element.x).toList().length == 3) {
      return true;
    }
    if (tiles.where((element) => 2 - element.y == element.y).toList().length ==
        3) {
      return true;
    }
    for (int i = 0; i < 3; i++) {
      if (tiles.where((tile) => tile.x == i).toList().length == 3) {
        return true;
      }
      if (tiles.where((tile) => tile.y == i).toList().length == 3) {
        return true;
      }
    }
    return false;
  }
}
