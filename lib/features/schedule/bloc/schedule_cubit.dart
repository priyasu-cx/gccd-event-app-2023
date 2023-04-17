import 'package:ccd2023/features/schedule/data/models/schedule_model.dart';
import 'package:ccd2023/features/schedule/data/repository/schedule_repo.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'schedule_cubit.freezed.dart';

class ScheduleCubit extends HydratedCubit<ScheduleState> {
  ScheduleCubit(this._scheduleRepository)
      : super(const ScheduleState.initial());

  final ScheduleRepository _scheduleRepository;

  Future<void> getSchedule() async {
    emit(const ScheduleState.loading());
    try {
      final schedule = await _scheduleRepository.getSchedule();
      emit(ScheduleState.loaded(schedule));
    } on DioError catch (e) {
      emit(
        ScheduleState.error(e.message ?? 'Unknown Error Occurred'),
      );
    } on Exception catch (e) {
      emit(ScheduleState.error(e.toString()));
    }
  }

  @override
  ScheduleState? fromJson(Map<String, dynamic> json) => ScheduleState.loaded(
        (json['schedule'] as List<dynamic>)
            .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  @override
  Map<String, dynamic>? toJson(ScheduleState state) => {
        'schedule':
            state.maybeMap(orElse: () => [], loaded: (value) => value.schedule),
      };
}

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState.initial() = _Initial;
  const factory ScheduleState.loading() = _Loading;
  const factory ScheduleState.loaded(List<Schedule> schedule) = _Loaded;
  const factory ScheduleState.error(String message) = _Error;
}
