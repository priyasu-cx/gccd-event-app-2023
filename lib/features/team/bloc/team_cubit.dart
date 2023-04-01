import 'dart:convert';
import 'package:ccd2023/features/team/model/team_model.dart';
import 'package:ccd2023/features/team/repo/team_repo.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'team_cubit.freezed.dart';

// class TeamBloc {
//   final String apiUrl = 'https://raw.githubusercontent.com/gdgcloudkol/ccd2023/prod/src/assets/content/team/content.json';
//
//   Future<List<Team>> getTeam() async {
//     var response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Team.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load team data');
//     }
//   }
// }

@freezed
class TeamState with _$TeamState {
  const factory TeamState.initial() = _Initial;

  const factory TeamState.loading() = _Loading;

  const factory TeamState.loaded(List<Team> team) = _Loaded;

  const factory TeamState.error(String message) = _Error;
}

class TeamCubit extends HydratedCubit<TeamState> {
  TeamCubit(this._teamRepository) : super(const TeamState.initial());
  final TeamRepository _teamRepository;

  Future<void> getTeam() async {
    emit(const TeamState.loading());
    try {
      final team = await _teamRepository.getTeam();
      emit(TeamState.loaded(team));
    } on DioError catch (e) {
      emit(
        TeamState.error(e.message ?? 'Unknown Error Occurred'),
      );
    } on Exception catch (e) {
      emit(TeamState.error(e.toString()));
    }
  }

  @override
TeamState? fromJson(Map<String, dynamic> json) => TeamState.loaded(
      (json['team'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

  @override
  Map<String, dynamic>? toJson(TeamState state) => {
        'team': state.maybeMap(
          loaded: (value) => value.team,
          orElse: () => [],
        ),
      };
}
