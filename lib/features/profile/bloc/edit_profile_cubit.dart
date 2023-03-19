import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_cubit.freezed.dart';

class EditProfileCubit extends Cubit<EditState> {
  EditProfileCubit() : super(const EditState());

  void toggleEditing() {
    emit(
      state.copyWith(isEditing: !state.isEditing),
    );
  }
}

@freezed
class EditState with _$EditState {
  const factory EditState({@Default(false) bool isEditing}) = _EditState;
}
