import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../speaker.dart';

part 'event_cubit.freezed.dart';

@freezed
class EventState with _$EventState {
  const factory EventState.initial() = _Initial;

  const factory EventState.loading() = _Loading;

  const factory EventState.loaded(List<Event> events) = _Loaded;

  const factory EventState.error(String message) = _Error;
}

class EventCubit extends Cubit<EventState> {
  EventCubit(this._eventRepository) : super(const EventState.initial());

  final EventRepository _eventRepository;

  Future<void> getEvents({required String authToken}) async {
    emit(const EventState.loading());
    try {
      final events = await _eventRepository.getEvents(authToken);
      emit(EventState.loaded(events));
    } on DioError catch (e) {
      emit(EventState.error(e.message ?? 'Unknown Error Occurred'));
    } on Exception catch (e) {
      emit(EventState.error(e.toString()));
    }
  }
}
