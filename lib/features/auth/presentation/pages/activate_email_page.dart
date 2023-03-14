import 'package:flutter/material.dart';

class ActivateEmailPage extends StatelessWidget {
  const ActivateEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:true,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Activate Email"),
        ),
        body: const Center(
          child: Text("Check your email to activate your account"),
        ),
      )
    );
  }
}
