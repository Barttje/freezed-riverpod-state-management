import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_riverpod_state/model/Progress.dart';

import 'PlayerType.dart';
import 'Tile.dart';

part 'GameState.freezed.dart';

@freezed
class GameState with _$GameState {
  factory GameState(
    Map<Tile, PlayerType> tiles,
    Progress progress, {
    @Default(PlayerType.CIRCLE) PlayerType currentPlayer,
  }) = _GameState;
}
