import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_riverpod_state/model/FinishedState.dart';

part 'Progress.freezed.dart';

@freezed
class Progress with _$Progress {
  const factory Progress.finished(FinishedState winner) = Finished;
  const factory Progress.inProgress() = InProgress;
}
