import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditStateBLoc extends Cubit<EditStateBLocState> {
  bool isEditing = false;
  Key profileFormKey = GlobalKey<ReactiveFormBuilderState>();

  EditStateBLoc() : super(MyInitialState());

  void toggleEditing() {
    isEditing = !isEditing;
    emit(MyUpdatedState());
  }
}

abstract class EditStateBLocState {}

class MyInitialState extends EditStateBLocState {}

class MyUpdatedState extends EditStateBLocState {}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditStateBLoc, EditStateBLocState>(
      builder: (context, state) {
        if (state is MyInitialState) {
          return Text('Not editing');
        } else if (state is MyUpdatedState) {
          return Text('Editing');
        }
        return Container();
      },
    );
  }
}