import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  FormGroup _formBuilder() => fb.group(
    {
      emailControlName: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
    },
  );

  @override
  Widget build(BuildContext context) {
    return FormWrapper(
        appBarTitle: "Forgot Password",
        loginButtonText: "Reset Password",
        onSubmit: (data)=>print("Reset Password"),
        formBuilder: _formBuilder,
        formContent: [
          const Text(
            "Registered Email",
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 6),
          ReactiveTextField(
            formControlName: emailControlName,
            autofillHints: const [AutofillHints.email],
            validationMessages: {
              ValidationMessage.required: (_) => 'Email cannot be empty',
            },
          ),
        ],
    );
  }
}
