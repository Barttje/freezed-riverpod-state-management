// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:freezed_riverpod_state/main.dart';
import 'package:freezed_riverpod_state/screen/Tiles.dart';

///
/// Real basic test - basically replaced the original implementation
/// that was based on the default example project (which doesn't apply).
/// 
/// This at least shows no build errors and the test runs cleanly.
/// 
/// Further tests are left as an exercise for later.
/// 
/// 16-Jul-2021 - rickb
/// 
void main() {
  testWidgets('Tiles smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(child: TicTacToe()));

    expect(find.byType(Tiles), findsOneWidget);
  });
}
