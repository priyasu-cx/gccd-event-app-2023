import 'package:ccd2023/features/speaker/data/payloads/talk_payload.dart';
import 'package:ccd2023/features/speaker/speaker.dart';
import 'package:dio/dio.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/payloads/submitted_talk_payload.dart';

part 'cfs_cubit.freezed.dart';

class CFSCubit extends Cubit<CFSState> {
  CFSCubit(this.cfsRepository) : super(const CFSState());

  final CFSRepository cfsRepository;

  Future<void> submitSpeakerProfile({
    required SpeakerPayload payload,
    required String authToken,
  }) async {
    try {
      await cfsRepository.submitSpeakerProfile(payload, authToken);
    } on DioError catch (e) {
      DjangoflowAppSnackbar.showError(e.message ?? 'Unknown Error Occurred');
    } on Exception catch (e) {
      DjangoflowAppSnackbar.showError(e.toString());
    }
  }

  Future<void> submitTalk({
    required TalkPayload payload,
    required String authToken,
    bool update = false,
  }) async {
    try {
      if (update) {
        await cfsRepository.updateTalk(payload, authToken);
        //TODO add update state logic here
      } else {
        await cfsRepository.submitTalk(payload, authToken);
      }
    } on DioError catch (e) {
      DjangoflowAppSnackbar.showError(e.message ?? 'Unknown Error Occurred');
    } on Exception catch (e) {
      DjangoflowAppSnackbar.showError(e.toString());
    }
  }

  Future<void> deleteTalk({required String authToken, required int id}) async {
    try {
      await cfsRepository.deleteTalk(authToken, id);
      List<SubmittedTalkPayload> talks = [...state.talks];
      talks.removeWhere((element) => element.id == id);
      emit(state.copyWith(talks: talks));
    } on DioError catch (e) {
      DjangoflowAppSnackbar.showError(e.message ?? 'Unknown Error Occurred');
    } on Exception catch (e) {
      DjangoflowAppSnackbar.showError(e.toString());
    }
  }

  Future<void> checkSpeakerProfileExists({
    required String authToken,
  }) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    final response = await cfsRepository.getSpeakerList(authToken);
    emit(
      state.copyWith(
        isSpeaker: response.isNotEmpty,
        speakerId: response.isEmpty ? null : response.first['id'],
        loading: false,
      ),
    );
    if (response.isNotEmpty) {
      getTalksList(authToken);
    }
  }

  Future<void> getTalksList(String authToken) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    final response = await cfsRepository.getTalksList(authToken);
    emit(
      state.copyWith(
        talks: response,
        loading: false,
      ),
    );
  }
}

@freezed
class CFSState with _$CFSState {
  const factory CFSState({
    @Default(false) bool isSpeaker,
    int? speakerId,
    @Default(false) bool loading,
    @Default([]) List<SubmittedTalkPayload> talks,
  }) = _CFSState;
}
