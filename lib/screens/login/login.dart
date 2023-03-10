import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:ccd2023/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ccd2023/configurations/configurations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    final username = form.control('username').value as String;
    final password = form.control('password').value as String;

    await context.read<AuthCubit>().loginWithUsernamePassword(
          username: username,
          password: password,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign in to your account",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
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
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.1),
              child: ReactiveFormBuilder(
                form: _formBuilder,
                builder: (context, form, child) => AutofillGroup(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kPadding * 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Username",
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 6),
                        ReactiveTextField(
                          formControlName: 'username',
                          autofillHints: const [AutofillHints.username],
                          validationMessages: {
                            'required': (error) => 'Username cannot be empty',
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
                          formControlName: 'password',
                          obscureText: true,
                          validationMessages: {
                            ValidationMessage.required: (_) =>
                                'Password cannot be empty',
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
                                print("Create an account");
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
                        const SizedBox(height: kPadding * 2.5),
                        ReactiveFormConsumer(
                          builder: (buildContext, form, child) {
                            return ElevatedButton(
                              onPressed: form.valid
                                  ? () {
                                      _onSubmit(form);
                                    }
                                  : null,
                              child: SizedBox(
                                width: screenWidth! * 0.8,
                                height: 50,
                                child: const Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
