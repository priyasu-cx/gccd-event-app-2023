import 'package:ccd2023/utils/ccd_asset.dart';
import 'package:ccd2023/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final form = FormGroup({
    'username':
        FormControl<String>(value: '', validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  void _onSubmit() {
    print('Sign In !!!!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight! * 0.1),
            const Text(
              "Sign in to your account",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: screenHeight! * 0.08),
            SvgPicture.asset(
              GCCDImageAssets.victoriaSVGImage,
              width: screenWidth! * 0.8,
            ),
            SizedBox(height: screenHeight! * 0.08),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.1),
              child: ReactiveForm(
                formGroup: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Username",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 6),
                    ReactiveTextField(
                      formControlName: 'username',
                      validationMessages: {
                        'required': (error) => 'Username cannot be empty',
                      },
                      decoration: const InputDecoration(
                        // hintText: "Username",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff4285f4),
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 6),
                    ReactiveTextField(
                      formControlName: 'password',
                      obscureText: true,
                      validationMessages: {
                        'required': (error) => 'Password cannot be empty',
                        'minLength': (error) =>
                            'Password must have at least 8 characters'
                      },
                      decoration: const InputDecoration(
                        // hintText: "",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff4285f4),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(10),
                      ),
                      style: const TextStyle(color: Colors.black),
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
                    const SizedBox(height: 20),
                    ReactiveFormConsumer(
                      builder: (buildContext, form, child) {
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: form.valid ? _onSubmit : null,
                            child: Container(
                              width: screenWidth! * 0.8,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff4285f4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
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
          ],
        ),
      ),
    );
  }
}
