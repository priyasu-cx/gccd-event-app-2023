import 'package:ccd2023/features/speaker/data/models/speaker_model.dart';
import 'package:ccd2023/features/speaker/data/repos/speaker_repo.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'speaker_cubit.freezed.dart';

@freezed
class SpeakerState with _$SpeakerState {
  const factory SpeakerState.initial() = _Initial;

  const factory SpeakerState.loading() = _Loading;

  const factory SpeakerState.loaded(SpeakerModel speaker) = _Loaded;

  const factory SpeakerState.error(String message) = _Error;
}

class SpeakerCubit extends HydratedCubit<SpeakerState> {
  SpeakerCubit(this._speakerRepository) : super(SpeakerState.initial());

  final SpeakerRepository _speakerRepository;

  Future<void> getSpeaker() async {
    emit(SpeakerState.loading());
    try {
      final speaker = await _speakerRepository.getSpeaker();
      emit(SpeakerState.loaded(speaker));
    } on DioError catch (e) {
      emit(SpeakerState.error(e.message ?? 'Unknown Error Occurred'));
    } on Exception catch (e) {
      emit(SpeakerState.error(e.toString()));
    }
  }

  @override
  SpeakerState? fromJson(Map<String, dynamic> json) {
    return SpeakerState.loaded(SpeakerModel.fromJson(json));
  }

  @override
  Map<String, dynamic>? toJson(SpeakerState state) {
    if (state is _Loaded) {
      return state.speaker.toJson();
    }
    return null;
  }
}
