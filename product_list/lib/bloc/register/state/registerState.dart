import 'package:product_list/bloc/register/registerSubmitStatus.dart';

class RegisterState {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final RegisterSubmitStatus registerSubmitStatus;

  RegisterState({
    this.username = '',
    this.password = '',
    this.registerSubmitStatus = const InitialRegisterStatus(),
  });

  RegisterState copywith({
    String? username,
    String? password,
    RegisterSubmitStatus? registerSubmitStatus,
  }) {
    return RegisterState(
      username: username ?? this.username,
      password: password ?? this.password,
      registerSubmitStatus: registerSubmitStatus ?? this.registerSubmitStatus,
    );
  }
}
