import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// TODO: Add signup signup submit logic

  FormGroup _formBuilder() => fb.group(
    {
      passwordControlName: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      emailControlName: FormControl<String>(
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


  @override
  Widget build(BuildContext context) {
    return FormWrapper(
        appBarTitle: "Sign up for an account",
        loginButtonText: "Sign Up",
        onSubmit: (form) => print(form.value),
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
            formControlName: passwordControlName,
            obscureText: true,
            validationMessages: {
              ValidationMessage.required: (_) => 'Password cannot be empty',
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
