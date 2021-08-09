abstract class LoginEvent {}

class LoginUserNameChanged extends LoginEvent {
  final String? username;

  LoginUserNameChanged({this.username});
}

class LoginPasswordNameChanged extends LoginEvent {
  final String? password;

  LoginPasswordNameChanged({this.password});
}

class LoginSubmitted extends LoginEvent {}
