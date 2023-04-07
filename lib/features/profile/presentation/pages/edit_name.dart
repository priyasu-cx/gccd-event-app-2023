import 'package:ccd2023/features/profile/bloc/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditNameWrapper extends StatefulWidget {
  const EditNameWrapper({
    super.key,
    required this.formBuilder,
    required this.formContent,
  });

  final FormGroup Function() formBuilder;
  final List<Widget> formContent;

  @override
  State<EditNameWrapper> createState() => _EditNameWrapperState();
}

class _EditNameWrapperState extends State<EditNameWrapper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReactiveFormBuilder(
          form: widget.formBuilder,
          builder: (context, form, child) {
            if (context.watch<EditProfileCubit>().state.isEditing) {
              form.markAsEnabled();
            } else {
              form.markAsDisabled();
            }
            return AutofillGroup(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // const SizedBox(height: kPadding * 2),
                  // widget.headerText != null
                  //     ? Text(widget.headerText!,
                  //     style: Theme.of(context).textTheme.bodyLarge)
                  //     : const Offstage(),
                  // const SizedBox(height: kPadding * 2.5),
                  // ReactiveValueListenableBuilder<String>(
                  //   formControlName: socialLinkControlName,
                  //   builder: (context, value, child) => Icon(
                  //     getIcon(value.value),
                  //     color: Colors.white,
                  //   ),
                  // ),
                  ...widget.formContent,
                  // context.watch<EditProfileCubit>().state.isEditing
                  //     ? Center(
                  //   // width: screenWidth! * 0.5,
                  //   child: CircularProgressBuilder(
                  //     builder: (context, action, error) => SizedBox(
                  //       width: 50,
                  //       height: 50,
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: GCCDColor.googleGreen,
                  //           shape: const CircleBorder(),
                  //         ),
                  //         onPressed:
                  //         (ReactiveForm.of(context)?.valid ?? false)
                  //             ? action
                  //             : null,
                  //         child: const Center(
                  //           child: Icon(Icons.add,
                  //               color: Colors.white, size: 20),
                  //         ),
                  //       ),
                  //     ),
                  //     action: (_) => widget.onSubmit(form),
                  //   ),
                  // )
                  //     : const Offstage(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
