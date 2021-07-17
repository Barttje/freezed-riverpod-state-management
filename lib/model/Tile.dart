import 'package:freezed_annotation/freezed_annotation.dart';

part 'Tile.freezed.dart';

@freezed
class Tile with _$Tile {
  const factory Tile(int x, int y) = _Tile;
}
