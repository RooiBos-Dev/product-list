abstract class RegisterSubmitStatus {
  const RegisterSubmitStatus();
}

class InitialRegisterStatus extends RegisterSubmitStatus {
  const InitialRegisterStatus();
}

class RegisterSubmitting extends RegisterSubmitStatus {}

class RegisterSubmitSuccess extends RegisterSubmitStatus {}

class RegisterSubmitFalied extends RegisterSubmitStatus {
  final Object exception;

  RegisterSubmitFalied({required this.exception});
}
