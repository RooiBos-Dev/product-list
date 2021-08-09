import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/auth/authCredentials.dart';
import 'package:product_list/bloc/sessionState.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(Unauthenticated());

  void showAuth() => emit(Unauthenticated());

  void showSession(AuthCredentials credentials) {
    final sessionId = credentials.sessionId;
    emit(Authenticated(sessionId: sessionId));
  }
}
