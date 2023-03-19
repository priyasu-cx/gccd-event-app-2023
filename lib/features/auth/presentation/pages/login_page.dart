import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ccd2023/configurations/configurations.dart';

import '../../../app/presentation/pages/form_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FormGroup _formBuilder() => fb.group(
        {
          passwordControlName: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          usernameControlName: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
        },
      );

  Future<void> _onSubmit(FormGroup form, BuildContext context) async {
    final username = form.control(usernameControlName).value as String;
    final password = form.control(passwordControlName).value as String;

    await context.read<AuthCubit>().loginWithUsernamePassword(
          username: username,
          password: password,
        );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return FormWrapper(
      appBarTitle: 'Sign in to your account',
      submitButtonText: 'Login',
      formBuilder: _formBuilder,
      onSubmit: (form) async => _onSubmit(form, context),
      formContent: [
        const Text(
          "Username",
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        ReactiveTextField(
          formControlName: usernameControlName,
          autofillHints: const [AutofillHints.username],
          validationMessages: {
            ValidationMessage.required: (_) => 'Username cannot be empty',
          },
        ),
        const SizedBox(height: 20),
        const Text(
          "Password",
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        ReactiveTextField(
          autofillHints: const [AutofillHints.password],
          formControlName: passwordControlName,
          obscureText: true,
          validationMessages: {
            ValidationMessage.required: (_) => 'Password cannot be empty',
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                context.router.replace(const SignUpRoute());
              },
              child: Text(
                "Create an account",
                style: textTheme.labelMedium?.copyWith(
                  color: GCCDColor.googleBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.router.replace(const ForgotPassRoute());
              },
              child: Text(
                "Forgot your password?",
                style: textTheme.labelMedium?.copyWith(
                  color: GCCDColor.googleBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        // const SizedBox(
        //   height: kPadding * 3,
        // )
      ],
    );
  }
}
