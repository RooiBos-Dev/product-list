import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/auth/authCredentials.dart';
import 'package:product_list/bloc/session/sessionCubit.dart';

enum AuthState { login, register, confirmRegister }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;

  AuthCubit({required this.sessionCubit}) : super(AuthState.login);

  AuthCredentials? credentials;

  void showLogin() => emit(AuthState.login);
  void showRegister() => emit(AuthState.register);

  void launchSession(AuthCredentials credentials) =>
      sessionCubit.showSession(credentials);
}
