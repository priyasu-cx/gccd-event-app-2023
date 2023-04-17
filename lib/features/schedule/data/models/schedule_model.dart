import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    required DateTime? date,
    required List<TimeSlot>? timeSlots,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
}

@freezed
class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    List<Room>? rooms,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) => _$TimeSlotFromJson(json);
}

@freezed
class Room with _$Room {
  const factory Room({
    Session? session,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}

@freezed
class Session with _$Session {
  const factory Session({
    String? title,
    String? description,
    DateTime? startsAt,
    DateTime? endsAt,
    List<Speaker>? speakers,
    List<dynamic>? categories,
    String? room,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

@freezed
class Speaker with _$Speaker {
  const factory Speaker({
    String? name,
    String? profilePicture,
  }) = _Speaker;

  factory Speaker.fromJson(Map<String, dynamic> json) => _$SpeakerFromJson(json);
}

