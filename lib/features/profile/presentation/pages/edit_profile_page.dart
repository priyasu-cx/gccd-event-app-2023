import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/features/app/presentation/gccd_border.dart';
import 'package:ccd2023/features/profile/bloc/edit_profile_cubit.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProfileWrapper extends StatefulWidget {
  const EditProfileWrapper({
    super.key,
    this.headerText,
    required this.onSubmit,
    required this.formBuilder,
    required this.formContent,
    required this.editButtonText,
    required this.onSuccess,
  });

  final String? headerText;
  final String editButtonText;
  final Future<void> Function(FormGroup) onSubmit;
  final FormGroup Function() formBuilder;
  final List<Widget> formContent;
  final void Function()? onSuccess;

  @override
  State<EditProfileWrapper> createState() => _EditProfileWrapperState();
}

class _EditProfileWrapperState extends State<EditProfileWrapper> {
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
              child: GCCDBorder(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: kPadding * 2),
                    widget.headerText != null
                        ? Text(widget.headerText!,
                            style: Theme.of(context).textTheme.bodyLarge)
                        : const Offstage(),
                    const SizedBox(height: kPadding * 2.5),
                    ...widget.formContent,
                    const SizedBox(height: kPadding * 2.5),
                    context.watch<EditProfileCubit>().state.isEditing
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Center(
                              child: CircularProgressBuilder(
                                builder: (context, action, error) => SizedBox(
                                  width: screenWidth! * 0.54,
                                  child: ElevatedButton(
                                    onPressed:
                                        (ReactiveForm.of(context)?.valid ??
                                                false)
                                            ? action
                                            : null,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            kPadding * 1.5),
                                        child: Text(
                                          widget.editButtonText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                action: (_) => widget.onSubmit(form),
                              ),
                            ),
                          )
                        : const Offstage(),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
