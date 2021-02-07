import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_riverpod_state/controller/GameStateNotifier.dart';
import 'package:freezed_riverpod_state/model/GameState.dart';
import 'package:freezed_riverpod_state/model/PlayerType.dart';
import 'package:freezed_riverpod_state/model/Tile.dart';
import 'package:freezed_riverpod_state/model/FinishedState.dart';
import 'package:freezed_riverpod_state/screen/CirclePainter.dart';
import 'package:freezed_riverpod_state/screen/CrossPainter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _gameState =
    StateNotifierProvider((_) => GameStateNotifier(GameState(Map())));
final _tiles = Provider((ref) => ref.watch(_gameState.state).tiles);
final progress = Provider((ref) => ref.watch(_gameState.state).progress);
final _currentTile = ScopedProvider<MapEntry<Tile, PlayerType>>(null);

class Tiles extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var currentTiles = useProvider(_tiles);
    var _winner = useProvider(progress);
    useValueChanged(_winner, (_, __) {
      _winner.maybeWhen(
          finished: (winner) => triggerDialog(context, winner),
          orElse: () => {});
    });
    return Container(
      child: GridView.count(
        physics: new NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(12),
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: currentTiles.entries
            .map((entry) => ProviderScope(
                overrides: [_currentTile.overrideWithValue(entry)],
                child: TileWidget()))
            .toList(),
      ),
    );
  }

  void triggerDialog(BuildContext context, FinishedState finishState) {
    Future.delayed(
        const Duration(milliseconds: 900),
        () => showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return FinishDialog(finishState);
            }));
  }
}

class TileWidget extends HookWidget {
  const TileWidget({Key key}) : super(key: key);
  final Duration duration = const Duration(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    final tileEntry = useProvider(_currentTile);
    final _controller = useAnimationController(
        duration: duration, lowerBound: 0, upperBound: 100, initialValue: 0);
    useValueChanged(tileEntry.value, (_, __) {
      if (tileEntry.value == PlayerType.EMPTY) {
        _controller.reset();
      }
      if (tileEntry.value != PlayerType.EMPTY) {
        _controller.forward();
      }
    });

    switch (tileEntry.value) {
      case PlayerType.CROSS:
        return crossWidget(_controller);
      case PlayerType.CIRCLE:
        return circleWidget(_controller);
      case PlayerType.EMPTY:
        return emptyWidget(context, tileEntry.key);
    }
    throw Exception("PlayerType ${tileEntry.value} not supported");
  }

  Widget emptyWidget(BuildContext context, Tile tile) {
    return GestureDetector(
        onTap: () => {context.read(_gameState).toggle(tile)},
        child: Container(
          color: Colors.green[600],
        ));
  }

  Widget crossWidget(AnimationController _controller) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            color: Colors.green[600],
            child: CustomPaint(
              painter: CrossPainter(_controller.value),
            ),
          );
        });
  }

  Widget circleWidget(AnimationController _controller) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            color: Colors.green[600],
            child: CustomPaint(
              painter: CirclePainter(_controller.value),
            ),
          );
        });
  }
}

class FinishDialog extends StatelessWidget {
  final FinishedState _winner;

  FinishDialog(this._winner);

  String subtitle() {
    if (_winner == FinishedState.CROSS) {
      return "Cross won!";
    }
    if (_winner == FinishedState.CIRCLE) {
      return "Circle won!";
    }
    return "Nobody lost!";
  }

  String title() {
    if (_winner == FinishedState.DRAW) {
      return "We have no loser!";
    }
    return "We have a winner!";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title()),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(subtitle()),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Play Again'),
          onPressed: () {
            context.read(_gameState).reset();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
