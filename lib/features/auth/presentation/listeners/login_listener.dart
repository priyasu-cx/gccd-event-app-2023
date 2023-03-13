import 'package:ccd2023/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginListener extends BlocListener<AuthCubit, AuthState> {
  LoginListener({
    super.key,
    required this.onLogin,
    super.child,
    required this.onLogout,
  }) : super(
          listener: (context, state) => state.user != null
              ? onLogin.call(context, state)
              : onLogout.call(context),
          listenWhen: (previous, current) =>
              (previous.user == null) ||
              (previous.user?.username != current.user?.username),
        );

  final void Function(BuildContext context, AuthState authState) onLogin;
  final void Function(BuildContext context) onLogout;
}
