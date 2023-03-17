import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/configurations/theme/ccd_asset.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProfileWrapper extends StatelessWidget {
  const EditProfileWrapper({
    super.key,
    required this.onSubmit,
    required this.formBuilder,
    required this.formContent,
    required this.editButtonText,
  });

  final String editButtonText;
  final Future<void> Function(FormGroup) onSubmit;
  final FormGroup Function() formBuilder;
  final List<Widget> formContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: screenHeight! * 0.08),
        Text("Profile Details",
            style: Theme.of(context).textTheme.bodyLarge),
        ReactiveFormBuilder(
          form: formBuilder,
          builder: (context, form, child) => AutofillGroup(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: kPadding * 2.5),
                  ...formContent,
                  const SizedBox(height: kPadding * 2.5),
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
                                  editButtonText,
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
                        action: (_) => onSubmit(form),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
