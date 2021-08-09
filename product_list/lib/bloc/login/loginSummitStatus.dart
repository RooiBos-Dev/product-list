abstract class LoginSubmitStatus {
  const LoginSubmitStatus();
}

class InitialLoginStatus extends LoginSubmitStatus {
  const InitialLoginStatus();
}

class LoginSubmitting extends LoginSubmitStatus {}

class LoginSubmitSuccess extends LoginSubmitStatus {}

class LoginSubmitFalied extends LoginSubmitStatus {
  final Object exception;

  LoginSubmitFalied({required this.exception});
}
