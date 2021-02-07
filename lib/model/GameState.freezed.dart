// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'GameState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GameStateTearOff {
  const _$GameStateTearOff();

// ignore: unused_element
  _GameState call(Map<Tile, PlayerType> tiles,
      {PlayerType currentPlayer = PlayerType.CIRCLE, Progress progress}) {
    return _GameState(
      tiles,
      currentPlayer: currentPlayer,
      progress: progress,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GameState = _$GameStateTearOff();

/// @nodoc
mixin _$GameState {
  Map<Tile, PlayerType> get tiles;
  PlayerType get currentPlayer;
  Progress get progress;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res>;
  $Res call(
      {Map<Tile, PlayerType> tiles,
      PlayerType currentPlayer,
      Progress progress});

  $ProgressCopyWith<$Res> get progress;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;

  @override
  $Res call({
    Object tiles = freezed,
    Object currentPlayer = freezed,
    Object progress = freezed,
  }) {
    return _then(_value.copyWith(
      tiles: tiles == freezed ? _value.tiles : tiles as Map<Tile, PlayerType>,
      currentPlayer: currentPlayer == freezed
          ? _value.currentPlayer
          : currentPlayer as PlayerType,
      progress: progress == freezed ? _value.progress : progress as Progress,
    ));
  }

  @override
  $ProgressCopyWith<$Res> get progress {
    if (_value.progress == null) {
      return null;
    }
    return $ProgressCopyWith<$Res>(_value.progress, (value) {
      return _then(_value.copyWith(progress: value));
    });
  }
}

/// @nodoc
abstract class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(
          _GameState value, $Res Function(_GameState) then) =
      __$GameStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<Tile, PlayerType> tiles,
      PlayerType currentPlayer,
      Progress progress});

  @override
  $ProgressCopyWith<$Res> get progress;
}

/// @nodoc
class __$GameStateCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(_GameState _value, $Res Function(_GameState) _then)
      : super(_value, (v) => _then(v as _GameState));

  @override
  _GameState get _value => super._value as _GameState;

  @override
  $Res call({
    Object tiles = freezed,
    Object currentPlayer = freezed,
    Object progress = freezed,
  }) {
    return _then(_GameState(
      tiles == freezed ? _value.tiles : tiles as Map<Tile, PlayerType>,
      currentPlayer: currentPlayer == freezed
          ? _value.currentPlayer
          : currentPlayer as PlayerType,
      progress: progress == freezed ? _value.progress : progress as Progress,
    ));
  }
}

/// @nodoc
class _$_GameState implements _GameState {
  _$_GameState(this.tiles,
      {this.currentPlayer = PlayerType.CIRCLE, this.progress})
      : assert(tiles != null),
        assert(currentPlayer != null);

  @override
  final Map<Tile, PlayerType> tiles;
  @JsonKey(defaultValue: PlayerType.CIRCLE)
  @override
  final PlayerType currentPlayer;
  @override
  final Progress progress;

  @override
  String toString() {
    return 'GameState(tiles: $tiles, currentPlayer: $currentPlayer, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameState &&
            (identical(other.tiles, tiles) ||
                const DeepCollectionEquality().equals(other.tiles, tiles)) &&
            (identical(other.currentPlayer, currentPlayer) ||
                const DeepCollectionEquality()
                    .equals(other.currentPlayer, currentPlayer)) &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tiles) ^
      const DeepCollectionEquality().hash(currentPlayer) ^
      const DeepCollectionEquality().hash(progress);

  @JsonKey(ignore: true)
  @override
  _$GameStateCopyWith<_GameState> get copyWith =>
      __$GameStateCopyWithImpl<_GameState>(this, _$identity);
}

abstract class _GameState implements GameState {
  factory _GameState(Map<Tile, PlayerType> tiles,
      {PlayerType currentPlayer, Progress progress}) = _$_GameState;

  @override
  Map<Tile, PlayerType> get tiles;
  @override
  PlayerType get currentPlayer;
  @override
  Progress get progress;
  @override
  @JsonKey(ignore: true)
  _$GameStateCopyWith<_GameState> get copyWith;
}
