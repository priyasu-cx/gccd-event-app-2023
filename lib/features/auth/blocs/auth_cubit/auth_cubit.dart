import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:dio/dio.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_cubit.freezed.dart';

part 'auth_cubit.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    String? accessToken,
    String? refreshToken,
    Profile? profile,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}

class AuthCubit extends HydratedCubit<AuthState> {
  static AuthCubit get instance => _instance;
  static final AuthCubit _instance = AuthCubit._internal();
  AuthenticationRepository? _authenticationRepository;

  AuthCubit._internal() : super(const AuthState());

  void initialize(AuthenticationRepository authenticationRepository) {
    if (_authenticationRepository != null) {
      throw Exception('Already initialized');
    }

    _authenticationRepository = authenticationRepository;
  }

  void _login(
    User user,
    String accessToken,
    String refreshToken,
    Profile profile,
  ) =>
      emit(
        state.copyWith(
          user: user,
          accessToken: accessToken,
          refreshToken: refreshToken,
          profile: profile,
        ),
      );

  void logout() {
    emit(
      state.copyWith(
        user: null,
        accessToken: null,
        refreshToken: null,
        profile: null,
      ),
    );
  }

  Future<void> loginWithUsernamePassword({
    required String password,
    required String username,
  }) async {
    try {
      if (_authenticationRepository == null) {
        throw Exception('AuthCubit not initialized');
      }
      final loginResponse = await _authenticationRepository?.signIn(
        email: '',
        username: username,
        password: password,
      );
      if (loginResponse != null) {
        _login(
          loginResponse.user,
          loginResponse.accessToken,
          loginResponse.refreshToken,
          loginResponse.user.profile,
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final errorData = e.response!.data as Map<String, dynamic>;
        if (errorData.containsKey('non_field_errors')) {
          DjangoflowAppSnackbar.showError(
            errorData['non_field_errors'][0],
          );
        } else {
          DjangoflowAppSnackbar.showError(
            errorData.toString(),
          );
        }
      } else {
        DjangoflowAppSnackbar.showError(e.message ?? 'Error occurred');
      }
    } on Exception catch (e) {
      DjangoflowAppSnackbar.showError(e.toString());
    }
  }

  Future<void> signUpWithUsernamePassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      if (_authenticationRepository == null) {
        throw Exception('AuthCubit not initialized');
      }
      final signUpResponse = await _authenticationRepository?.signUp(
        email: email,
        username: username,
        password: password,
      );
      if (signUpResponse != null) {
        DjangoflowAppSnackbar.showInfo(
          'Sign up successful! Please verify email and login.',
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final errorData = e.response!.data as Map<String, dynamic>;
        if (errorData.containsKey('email')) {
          DjangoflowAppSnackbar.showError(
            errorData['email'][0],
          );
        } else if (errorData.containsKey('username')) {
          DjangoflowAppSnackbar.showError(
            errorData['username'][0],
          );
        } else {
          DjangoflowAppSnackbar.showError(
            errorData.toString(),
          );
        }
      } else {
        DjangoflowAppSnackbar.showError(e.message ?? 'Error occurred');
      }
    } on Exception catch (e) {
      DjangoflowAppSnackbar.showError(e.toString());
    }
  }

  Future<void> forgotPassword({
    required String email,
  }) async {
    try {
      if (_authenticationRepository == null) {
        throw Exception('AuthCubit not initialized');
      }
      final forgotPasswordResponse =
          await _authenticationRepository?.resetPassword(
        email: email,
      );
      if (forgotPasswordResponse != null) {
        if (forgotPasswordResponse['detail'] == passwordResetResponse) {
          DjangoflowAppSnackbar.showInfo(
            'Password reset email sent!',
          );
        }
      }
    } on DioError catch (e) {
      DjangoflowAppSnackbar.showError(e.message ?? 'Error occurred');
    } on Exception catch (e) {
      DjangoflowAppSnackbar.showError(e.toString());
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toJson();

  @override
  AuthState? fromJson(Map<String, dynamic> json) => AuthState.fromJson(json);
}
