import 'package:product_list/bloc/login/loginSummitStatus.dart';

class LoginState {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final LoginSubmitStatus loginSubmitStatus;

  LoginState({
    this.username = '',
    this.password = '',
    this.loginSubmitStatus = const InitialLoginStatus(),
  });

  LoginState copywith({
    String? username,
    String? password,
    LoginSubmitStatus? loginSubmitStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      loginSubmitStatus: loginSubmitStatus ?? this.loginSubmitStatus,
    );
  }
}
