import 'package:ccd2023/features/speaker/speaker.dart';
import 'package:dio/dio.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
        loading: false,
      ),
    );
  }
}

@freezed
class CFSState with _$CFSState {
  const factory CFSState({
    @Default(false) bool isSpeaker,
    @Default(false) bool loading,
  }) = _CFSState;
}
