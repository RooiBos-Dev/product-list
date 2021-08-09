abstract class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class Authenticated extends SessionState {
  final String? sessionId;

  Authenticated({required this.sessionId});
}
