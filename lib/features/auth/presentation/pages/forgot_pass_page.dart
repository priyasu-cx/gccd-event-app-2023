import 'package:auto_route/auto_route.dart';
import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/configurations/router/ccd_router.gr.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  Future<void> _onSubmit(FormGroup form, BuildContext context) async {
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
      submitButtonText: "Reset Password",
      onSubmit: (form) async => _onSubmit(form, context),
      onSuccess: () => context.router.replace(const HomeRoute()),
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
