import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Future<void> _onSubmit(FormGroup form) async {
    final email = form.control(emailControlName).value as String;
    final username = form.control(usernameControlName).value as String;
    final password = form.control(passwordControlName).value as String;

    final signupresponse =

    await context.read<AuthCubit>().signUpWithUsernamePassword(
          email: email,
          username: username,
          password: password,
        );

    if (signupresponse == true) {
      context.router.replace( ActivateEmailRoute(title: "Email Verification", message: "Check Inbox for Email Verification"));
    }
  }

  FormGroup _formBuilder() => fb.group({
        passwordControlName: FormControl<String>(
          validators: [
            Validators.required,
            // Validators.compare(passwordControlName, confirmPasswordControlName, CompareOption.equal),
          ],
        ),
        confirmPasswordControlName: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        emailControlName: FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        usernameControlName: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
      }, [
        Validators.mustMatch(passwordControlName, confirmPasswordControlName),
      ]);

  @override
  Widget build(BuildContext context) {
    return FormWrapper(
      appBarTitle: "Sign up for an account",
      loginButtonText: "Sign Up",
      onSubmit: _onSubmit,
      formBuilder: _formBuilder,
      formContent: [
        const Text(
          "Email",
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
        const SizedBox(height: 20),
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
            ValidationMessage.mustMatch: (_) => 'Passwords do not match',
          },
        ),
        const SizedBox(height: 20),
        const Text(
          "Confirm Password",
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        ReactiveTextField(
          autofillHints: const [AutofillHints.password],
          formControlName: confirmPasswordControlName,
          obscureText: true,
          validationMessages: {
            ValidationMessage.required: (_) => 'Password cannot be empty',
            ValidationMessage.mustMatch: (_) => 'Passwords do not match',
          },
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            if (kDebugMode) {
              print("Login to your account");
            }
            context.router.push(const LoginRoute());
          },
          child: const Text(
            "Already have an account ?",
            style: TextStyle(
              color: Color(0xff4285f4),
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
