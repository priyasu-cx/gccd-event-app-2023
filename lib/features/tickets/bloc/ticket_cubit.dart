import 'package:ccd2023/features/tickets/data/model/ticket_model.dart';
import 'package:ccd2023/features/tickets/data/ticket_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_cubit.freezed.dart';

part 'ticket_cubit.g.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit(this.ticketRepository) : super(const TicketState());

  final TicketRepository ticketRepository;

  Future<void> checkTicketStatus(String? authToken) async {
    if (authToken == null) {
      return;
    } else if (state.hasTickets) {
      return;
    }

    // try {
      emit(state.copyWith(isLoading: true));
      final response = await ticketRepository.getTicketInfo(authToken);
      if (response.isEmpty) {
        emit(
          state.copyWith(hasTickets: false, isLoading: false),
        );
      } else {
        emit(
          state.copyWith(
            hasTickets: true,
            isLoading: false,
            ticket : Ticket.fromJson(response[0]),
          ),
        );
      }
    // } catch (e) {
    //   print(e);
    // }
  }

  void clearTicketStatus() {
    emit(
      state.copyWith(
        hasTickets: false,
        ticket:null,
      ),
    );
  }
}

@freezed
class TicketState with _$TicketState {
  const factory TicketState({
    @Default(false) bool hasTickets,
    @Default(false) bool isLoading,
    Ticket? ticket,
  }) = _TicketState;

  factory TicketState.fromJson(Map<String, dynamic> json) =>
      _$TicketStateFromJson(json);
}
