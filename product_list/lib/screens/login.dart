import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/auth/authCubit.dart';
import 'package:product_list/bloc/auth/authRepository.dart';
import 'package:product_list/bloc/login/event/loginEvent.dart';
import 'package:product_list/bloc/login/loginBloc.dart';
import 'package:product_list/bloc/login/loginSummitStatus.dart';
import 'package:product_list/bloc/login/state/loginState.dart';
import 'package:product_list/theme/colours.dart';

class Login extends StatelessWidget {
  Login({required Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.lightgrey,
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepository: context.read<AuthRepository>(),
          authCubit: context.read<AuthCubit>(),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _loginForm(),
            _registerButton(context),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final loginSubmitStatus = state.loginSubmitStatus;
        if (loginSubmitStatus is LoginSubmitFalied) {
          _showErrorSnackBar(context, loginSubmitStatus.toString());
        }
        if (loginSubmitStatus is LoginSubmitSuccess) {
          _showSuccessSnackBar(context, 'Login Success');
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _usernameField(),
                _passwordField(),
                _loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person_outline_outlined),
            hintText: 'Username',
          ),
          validator: (value) =>
              state.isValidUsername ? null : 'Username is to short',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginUserNameChanged(username: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.lock_outline),
            hintText: 'Password',
          ),
          validator: (value) =>
              state.isValidPassword ? null : 'Password is to short',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginPasswordNameChanged(password: value)),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.loginSubmitStatus is LoginSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginSubmitted());
                  }
                },
                child: Text('Login'),
              );
      },
    );
  }

  Widget _registerButton(BuildContext context) {
    return SafeArea(
      child: TextButton(
        child: Text('Don\'t have and account? Register here'),
        onPressed: () => context.read<AuthCubit>().showRegister(),
      ),
    );
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: Colours.green,
      behavior: SnackBarBehavior.floating,
      content: Text(
        '$message',
        style: TextStyle(color: Colours.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colours.red,
        behavior: SnackBarBehavior.floating,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.error),
            ),
            Text(
              '$message',
              style: TextStyle(color: Colours.white),
            ),
          ],
        ),
      ),
    );
  }
}
