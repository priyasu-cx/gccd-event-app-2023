import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../configurations/configurations.dart';
import '../../../../utils/size_util.dart';
import 'package:progress_builder/progress_builder.dart';

class FormWrapper extends StatelessWidget {
  const FormWrapper({
    super.key,
    required this.appBarTitle,
    required this.onSubmit,
    required this.formBuilder,
    required this.formContent,
    required this.submitButtonText,
    this.onSuccess,
  });

  final String appBarTitle;
  final String submitButtonText;
  final Future<void> Function(FormGroup) onSubmit;
  final void Function()? onSuccess;
  final FormGroup Function() formBuilder;
  final List<Widget> formContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight! * 0.1),
            SvgPicture.asset(
              GCCDImageAssets.victoriaSVGImage,
              width: screenWidth! * 0.8,
            ),
            SizedBox(height: screenHeight! * 0.08),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
              child: ReactiveFormBuilder(
                form: formBuilder,
                builder: (context, form, child) => AutofillGroup(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kPadding * 2,
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
                              onSuccess: onSuccess,
                              builder: (context, action, error) =>
                                  ElevatedButton(
                                onPressed:
                                    (ReactiveForm.of(context)?.valid ?? false)
                                        ? action
                                        : null,
                                child: Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.all(kPadding * 1.5),
                                    child: Text(
                                      submitButtonText,
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
                              action: (_) => onSubmit(form),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: kPadding * 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
