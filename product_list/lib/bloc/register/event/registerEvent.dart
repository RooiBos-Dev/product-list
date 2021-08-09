abstract class RegisterEvent {}

class RegisterUserNameChanged extends RegisterEvent {
  final String? username;

  RegisterUserNameChanged({this.username});
}

class RegisterPasswordNameChanged extends RegisterEvent {
  final String? password;

  RegisterPasswordNameChanged({this.password});
}

class RegisterSubmitted extends RegisterEvent {}
