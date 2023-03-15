import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  Future<void> _onSubmit(FormGroup form) async {
    final email = form.control(emailControlName).value as String;

    await context.read<AuthCubit>().forgotPassword(
          email: email,
        );
  }

  FormGroup _formBuilder() => fb.group(
        {
          emailControlName: FormControl<String>(
            validators: [
              Validators.required,
              Validators.email,
            ],
          ),
        },
      );

  @override
  Widget build(BuildContext context) {
    return FormWrapper(
      appBarTitle: "Forgot Password",
      loginButtonText: "Reset Password",
      onSubmit: _onSubmit,
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
            ValidationMessage.email: (_) => 'Email is not valid',
          },
        ),
      ],
    );
  }
}
