import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    required int id,
    @JsonKey(name: 'date_bought') required String dateBought,
    required String amount,
    @JsonKey(name: 'ts_booking_id') required int tsBookingId,
    @JsonKey(name: 'ts_order_id') required int tsOrderId,
    @JsonKey(name: 'ts_ticket_name') required String tsTicketName,
    @JsonKey(name: 'ts_user_email_id') required String tsUserEmailID,
    @JsonKey(name: 'ts_all_data') required Map<String, dynamic> tsData,
    required int user,
    required int event,
  }) = _Ticket;


  factory Ticket.fromJson(Map<String, dynamic> json) =>
      _$TicketFromJson(json);
}
