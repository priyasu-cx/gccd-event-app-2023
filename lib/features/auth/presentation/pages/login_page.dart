import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:flutter/foundation.dart';
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

  void _onSubmit(FormGroup form) async {
    final username = form.control(usernameControlName).value as String;
    final password = form.control(passwordControlName).value as String;

    await context.read<AuthCubit>().loginWithUsernamePassword(
          username: username,
          password: password,
        );
  }

  @override
  Widget build(BuildContext context) {
    return FormWrapper(
      appBarTitle: 'Sign in to your account',
      loginButtonText: 'Login',
      formBuilder: _formBuilder,
      onSubmit: _onSubmit,
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
                if (kDebugMode) {
                  print("Create an account");
                }
                context.router.push(const SignUpRoute());
              },
              child: const Text(
                "Create an account",
                style: TextStyle(
                  color: Color(0xff4285f4),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("Forgot your password?");
                context.router.push(const ForgotPassRoute());
              },
              child: const Text(
                "Forgot your password?",
                style: TextStyle(
                  color: Color(0xff4285f4),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
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
