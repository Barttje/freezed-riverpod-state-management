import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_riverpod_state/model/FinishedState.dart';

part 'Progress.freezed.dart';

@freezed
class Progress with _$Progress {
  factory Progress.finished(FinishedState winner) = Finished;
  factory Progress.inProgress() = InProgress;
}
