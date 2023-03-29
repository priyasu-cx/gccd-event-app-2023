// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PartnersCubit extends Cubit<PartnersState> {
//   PartnersCubit() : super(PartnersInitialState());
//
//   Future<void> fetchData() async {
//     try {
//       emit(PartnersLoading());
//
//       final response = await http.get(Uri.parse('https://raw.githubusercontent.com/gdgcloudkol/ccd2023/prod/src/assets/content/partners/content.json'));
//
//       if (response.statusCode == 200) {
//         final communityPartners = json.decode(response.body);
//         print(communityPartners);
//         emit(PartnersLoaded(communityPartners));
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       emit(PartnersErrorState(e.toString()));
//     }
//   }
// }

// abstract class PartnersState {}
//
// class PartnersInitialState extends PartnersState {}
//
// class PartnersLoading extends PartnersState {}
//
// class PartnersLoaded extends PartnersState {
//   final List<dynamic> communityPartners;
//
//   PartnersLoaded(this.communityPartners);
// }
//
// class PartnersErrorState extends PartnersState {
//   final String message;
//
//   PartnersErrorState(this.message);
// }

import 'package:ccd2023/features/home/presentation/partners/models/partner_model.dart';
import 'package:ccd2023/features/home/presentation/partners/repo/partners_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'partners_cubit.freezed.dart';

@freezed
class PartnersState with _$PartnersState {
  const factory PartnersState.initial() = _Initial;

  const factory PartnersState.loading() = _Loading;

  const factory PartnersState.loaded(Partners partners) = _Loaded;

  const factory PartnersState.error(String message) = _Error;
}

class PartnersCubit extends Cubit<PartnersState> {
  PartnersCubit(this._partnersRepository)
      : super(const PartnersState.initial());

  final PartnersRepository _partnersRepository;

  Future<void> getPartners() async {
    emit(const PartnersState.loading());
    try {
      final partners = await _partnersRepository.getPartners();
      emit(PartnersState.loaded(partners));
    } on DioError catch (e) {
      emit(
        PartnersState.error(e.message ?? 'Unknown Error Occurred'),
      );
    } on Exception catch (e) {
      emit(PartnersState.error(e.toString()));
    }
  }
}