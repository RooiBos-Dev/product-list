import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/auth/authCubit.dart';
import 'package:product_list/bloc/auth/authRepository.dart';
import 'package:product_list/bloc/register/event/registerEvent.dart';
import 'package:product_list/bloc/register/registerSubmitStatus.dart';
import 'package:product_list/bloc/register/state/registerState.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;
  final AuthCubit authCubit;

  RegisterBloc({required this.authRepository, required this.authCubit})
      : super(RegisterState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    // username update state change on event
    if (event is RegisterUserNameChanged) {
      yield state.copywith(username: event.username);

      // password update state on event
    } else if (event is RegisterPasswordNameChanged) {
      yield state.copywith(password: event.password);

      // loggin submitted state change on event
    } else if (event is RegisterSubmitted) {
      yield state.copywith(registerSubmitStatus: RegisterSubmitting());

      try {
        await authRepository.register(state.username, state.password);
        yield state.copywith(registerSubmitStatus: RegisterSubmitSuccess());
        authCubit.showLogin();
      } catch (e) {
        yield state.copywith(
            registerSubmitStatus: RegisterSubmitFalied(exception: e));
      }
    } else {
      throw UnimplementedError();
    }
  }
}
