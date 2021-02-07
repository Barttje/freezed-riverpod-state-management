import 'package:freezed_annotation/freezed_annotation.dart';

part 'package:freezed_riverpod_state/model/Tile.freezed.dart';

@freezed
abstract class Tile with _$Tile {
  factory Tile(int x, int y) = _Tile;
}
