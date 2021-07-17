import 'package:flutter/material.dart';
import 'package:freezed_riverpod_state/controller/GameStateNotifier.dart';
import 'package:freezed_riverpod_state/model/GameState.dart';
import 'package:freezed_riverpod_state/model/PlayerType.dart';
import 'package:freezed_riverpod_state/model/Progress.dart';
import 'package:freezed_riverpod_state/model/Tile.dart';
import 'package:freezed_riverpod_state/model/FinishedState.dart';
import 'package:freezed_riverpod_state/screen/CirclePainter.dart';
import 'package:freezed_riverpod_state/screen/CrossPainter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _gameState = StateNotifierProvider<GameStateNotifier, GameState>(
    (_) => GameStateNotifier(GameState(Map(), Progress.inProgress())));

class Tiles extends HookConsumerWidget {
  void triggerDialog(BuildContext context, FinishedState finishState) {
    Future.delayed(
      const Duration(milliseconds: 900),
      () => showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (_) => FinishDialog(finishState),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(_gameState);
    useValueChanged<Progress, Function(Progress, Progress)>(gameState.progress,
        (progress, __) {
      gameState.progress.when(
          finished: (winner) => {triggerDialog(context, winner)},
          inProgress: () => {});
    });

    return Container(
      child: GridView.count(
        physics: new NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(12),
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: gameState.tiles.entries
            .map<Widget>((entry) => TileWidget(entry))
            .toList(),
      ),
    );
  }
}

class TileWidget extends HookConsumerWidget {
  const TileWidget(this.tileEntry);

  final Duration duration = const Duration(milliseconds: 700);
  final MapEntry<Tile, PlayerType> tileEntry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useAnimationController(
      duration: duration,
      upperBound: 100,
    );
    useValueChanged<PlayerType, Function(PlayerType, PlayerType)>(
        tileEntry.value, (_, __) {
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
        return emptyWidget(ref, tileEntry.key);
    }
  }

  Widget emptyWidget(WidgetRef ref, Tile tile) {
    return GestureDetector(
      onTap: () => ref.watch(_gameState.notifier).toggle(tile),
      child: Container(
        color: Colors.green[600],
      ),
    );
  }

  Widget crossWidget(AnimationController _controller) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Container(
        color: Colors.green[600],
        child: CustomPaint(
          painter: CrossPainter(_controller.value),
        ),
      ),
    );
  }

  Widget circleWidget(AnimationController _controller) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Container(
        color: Colors.green[600],
        child: CustomPaint(
          painter: CirclePainter(_controller.value),
        ),
      ),
    );
  }
}

class FinishDialog extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(_gameState.notifier);
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
            provider.reset();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
