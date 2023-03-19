import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProfileWrapper extends StatefulWidget {
  const EditProfileWrapper({
    super.key,
    this.headerText,
    this.headerDesc,
    required this.onSubmit,
    required this.formBuilder,
    required this.formContent,
    required this.editButtonText,
    required this.isEditing,
  });

  final String? headerText;
  final String? headerDesc;
  final String editButtonText;
  final Future<void> Function(FormGroup) onSubmit;
  final FormGroup Function() formBuilder;
  final List<Widget> formContent;
  final bool isEditing;

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
        // SizedBox(height: screenHeight! * 0.08),

        ReactiveFormBuilder(
          form: widget.formBuilder,
          builder: (context, form, child) => AutofillGroup(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.07),
                // height: screenWidth! * 0.3,
                width: screenWidth!,
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  border: Border(
                    top: BorderSide(
                      color: GCCDColor.googleRed,
                      width: 2,
                    ),
                    bottom: BorderSide(
                      color: GCCDColor.googleYellow,
                      width: 2,
                    ),
                    left: BorderSide(
                      color: GCCDColor.googleGreen,
                      width: 2,
                    ),
                    right: BorderSide(
                      color: GCCDColor.googleBlue,
                      width: 2,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: kPadding * 2),

                    widget.headerText != null ?
                    Text(widget.headerText!,
                        style: Theme.of(context).textTheme.bodyLarge)
                    : const SizedBox.shrink(),

                    widget.headerDesc != null ?
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(widget.headerDesc!,
                          // textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          )),
                    )
                        : const SizedBox.shrink(),

                    const SizedBox(height: kPadding * 2.5),
                    ...widget.formContent,
                    const SizedBox(height: kPadding * 2.5),
                    widget.isEditing ?
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Center(
                        child: CircularProgressBuilder(
                          builder: (context, action, error) => SizedBox(
                            width: screenWidth! * 0.54,
                            child: ElevatedButton(
                              onPressed:
                              (ReactiveForm.of(context)?.valid ?? false)
                                  ? action
                                  : null,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(kPadding * 1.5),
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
                    ): const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
