import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/auth/authCredentials.dart';
import 'package:product_list/bloc/auth/authCubit.dart';
import 'package:product_list/bloc/auth/authRepository.dart';
import 'package:product_list/bloc/login/event/loginEvent.dart';
import 'package:product_list/bloc/login/loginSummitStatus.dart';
import 'package:product_list/bloc/login/state/loginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final AuthCubit authCubit;

  LoginBloc({required this.authRepository, required this.authCubit})
      : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // username update state change on event
    if (event is LoginUserNameChanged) {
      yield state.copywith(username: event.username);

      // password update state on event
    } else if (event is LoginPasswordNameChanged) {
      yield state.copywith(password: event.password);

      // loggin submitted state change on event
    } else if (event is LoginSubmitted) {
      yield state.copywith(loginSubmitStatus: LoginSubmitting());

      try {
        final sessionId =
            await authRepository.login(state.username, state.password);
        yield state.copywith(loginSubmitStatus: LoginSubmitSuccess());

        authCubit.launchSession(
          AuthCredentials(
              username: state.username,
              password: state.password,
              sessionId: sessionId),
        );
      } catch (e) {
        yield state.copywith(
            loginSubmitStatus: LoginSubmitFalied(exception: e));
      }
    } else {
      throw UnimplementedError();
    }
  }
}
