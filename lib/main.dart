import 'package:flutter/material.dart';
import 'package:freezed_riverpod_state/screen/Tiles.dart';
import 'package:hooks_riverpod/all.dart';

void main() {
  runApp(ProviderScope(child: TicTacToe()));
}

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Freezed - Riverpod Example"),
          ),
          body: Tiles()),
    );
  }
}
