import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_social_cubit.freezed.dart';

class AddSocialCubit extends Cubit<AddSocialState> {
  AddSocialCubit() : super(const AddSocialState());

  void toggleAddSocial() {
    emit(
      state.copyWith(addSocial: !state.addSocial),
    );
  }
}

@freezed
class AddSocialState with _$AddSocialState {
  const factory AddSocialState({@Default(false) bool addSocial}) = _AddSocialState;
}

