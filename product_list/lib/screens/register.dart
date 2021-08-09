import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/auth/authCubit.dart';
import 'package:product_list/bloc/auth/authRepository.dart';
import 'package:product_list/bloc/login/loginSummitStatus.dart';
import 'package:product_list/bloc/register/event/registerEvent.dart';
import 'package:product_list/bloc/register/registerBloc.dart';
import 'package:product_list/bloc/register/registerSubmitStatus.dart';
import 'package:product_list/bloc/register/state/registerState.dart';
import 'package:product_list/screens/product/productListScreen.dart';
import 'package:product_list/theme/colours.dart';

class Register extends StatelessWidget {
  Register({required Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.lightgrey,
      body: BlocProvider(
        create: (context) => RegisterBloc(
          authRepository: context.read<AuthRepository>(),
          authCubit: context.read<AuthCubit>(),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _registerForm(),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _registerForm() {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        final registerSubmitStatus = state.registerSubmitStatus;
        if (registerSubmitStatus is RegisterSubmitFalied) {
          _showErrorSnackBar(context, registerSubmitStatus.toString());
        }
        if (registerSubmitStatus is RegisterSubmitSuccess) {
          _showSuccessSnackBar(context, 'Registration Successful');
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
                _registerButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person_outline_outlined),
            hintText: 'Username',
          ),
          validator: (value) =>
              state.isValidUsername ? null : 'Username is to short',
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(RegisterUserNameChanged(username: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
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
              .read<RegisterBloc>()
              .add(RegisterPasswordNameChanged(password: value)),
        );
      },
    );
  }

  Widget _registerButton() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return state.registerSubmitStatus is LoginSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<RegisterBloc>().add(RegisterSubmitted());
                  }
                },
                child: Text('Register'),
              );
      },
    );
  }

  Widget _loginButton(BuildContext context) {
    return SafeArea(
      child: TextButton(
        child: Text('Already have an account? Login here'),
        onPressed: () => context.read<AuthCubit>().showLogin(),
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
