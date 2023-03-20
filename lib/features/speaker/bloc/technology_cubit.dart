import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../speaker.dart';

part 'technology_cubit.freezed.dart';

@freezed
class TechnologyState with _$TechnologyState {
  const factory TechnologyState.initial() = _Initial;

  const factory TechnologyState.loading() = _Loading;

  const factory TechnologyState.loaded(List<Technology> technologies) = _Loaded;

  const factory TechnologyState.error(String message) = _Error;
}

class TechnologyCubit extends Cubit<TechnologyState> {
  TechnologyCubit(this._technologyRepository)
      : super(const TechnologyState.initial());

  final TechnologyRepository _technologyRepository;

  Future<void> getTechnologies() async {
    emit(const TechnologyState.loading());
    try {
      final technologies = await _technologyRepository.getTechnologies();
      emit(TechnologyState.loaded(technologies));
    } on DioError catch (e) {
      emit(
        TechnologyState.error(e.message ?? 'Unknown Error Occurred'),
      );
    } on Exception catch (e) {
      emit(TechnologyState.error(e.toString()));
    }
  }
}
