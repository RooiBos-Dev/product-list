class AuthCredentials {
  final String username;
  final String password;
  String? sessionId;

  AuthCredentials(
      {required this.username,
      required this.password,
      required this.sessionId});
}
