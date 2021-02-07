// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'Progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProgressTearOff {
  const _$ProgressTearOff();

// ignore: unused_element
  Finished finished(FinishedState winner) {
    return Finished(
      winner,
    );
  }

// ignore: unused_element
  InProgress inProgress() {
    return InProgress();
  }
}

/// @nodoc
// ignore: unused_element
const $Progress = _$ProgressTearOff();

/// @nodoc
mixin _$Progress {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult finished(FinishedState winner),
    @required TResult inProgress(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult finished(FinishedState winner),
    TResult inProgress(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult finished(Finished value),
    @required TResult inProgress(InProgress value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult finished(Finished value),
    TResult inProgress(InProgress value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ProgressCopyWith<$Res> {
  factory $ProgressCopyWith(Progress value, $Res Function(Progress) then) =
      _$ProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProgressCopyWithImpl<$Res> implements $ProgressCopyWith<$Res> {
  _$ProgressCopyWithImpl(this._value, this._then);

  final Progress _value;
  // ignore: unused_field
  final $Res Function(Progress) _then;
}

/// @nodoc
abstract class $FinishedCopyWith<$Res> {
  factory $FinishedCopyWith(Finished value, $Res Function(Finished) then) =
      _$FinishedCopyWithImpl<$Res>;
  $Res call({FinishedState winner});
}

/// @nodoc
class _$FinishedCopyWithImpl<$Res> extends _$ProgressCopyWithImpl<$Res>
    implements $FinishedCopyWith<$Res> {
  _$FinishedCopyWithImpl(Finished _value, $Res Function(Finished) _then)
      : super(_value, (v) => _then(v as Finished));

  @override
  Finished get _value => super._value as Finished;

  @override
  $Res call({
    Object winner = freezed,
  }) {
    return _then(Finished(
      winner == freezed ? _value.winner : winner as FinishedState,
    ));
  }
}

/// @nodoc
class _$Finished implements Finished {
  _$Finished(this.winner) : assert(winner != null);

  @override
  final FinishedState winner;

  @override
  String toString() {
    return 'Progress.finished(winner: $winner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Finished &&
            (identical(other.winner, winner) ||
                const DeepCollectionEquality().equals(other.winner, winner)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(winner);

  @JsonKey(ignore: true)
  @override
  $FinishedCopyWith<Finished> get copyWith =>
      _$FinishedCopyWithImpl<Finished>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult finished(FinishedState winner),
    @required TResult inProgress(),
  }) {
    assert(finished != null);
    assert(inProgress != null);
    return finished(winner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult finished(FinishedState winner),
    TResult inProgress(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (finished != null) {
      return finished(winner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult finished(Finished value),
    @required TResult inProgress(InProgress value),
  }) {
    assert(finished != null);
    assert(inProgress != null);
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult finished(Finished value),
    TResult inProgress(InProgress value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class Finished implements Progress {
  factory Finished(FinishedState winner) = _$Finished;

  FinishedState get winner;
  @JsonKey(ignore: true)
  $FinishedCopyWith<Finished> get copyWith;
}

/// @nodoc
abstract class $InProgressCopyWith<$Res> {
  factory $InProgressCopyWith(
          InProgress value, $Res Function(InProgress) then) =
      _$InProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$InProgressCopyWithImpl<$Res> extends _$ProgressCopyWithImpl<$Res>
    implements $InProgressCopyWith<$Res> {
  _$InProgressCopyWithImpl(InProgress _value, $Res Function(InProgress) _then)
      : super(_value, (v) => _then(v as InProgress));

  @override
  InProgress get _value => super._value as InProgress;
}

/// @nodoc
class _$InProgress implements InProgress {
  _$InProgress();

  @override
  String toString() {
    return 'Progress.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult finished(FinishedState winner),
    @required TResult inProgress(),
  }) {
    assert(finished != null);
    assert(inProgress != null);
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult finished(FinishedState winner),
    TResult inProgress(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult finished(Finished value),
    @required TResult inProgress(InProgress value),
  }) {
    assert(finished != null);
    assert(inProgress != null);
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult finished(Finished value),
    TResult inProgress(InProgress value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class InProgress implements Progress {
  factory InProgress() = _$InProgress;
}
