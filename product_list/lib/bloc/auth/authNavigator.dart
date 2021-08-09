import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/auth/authCubit.dart';
import 'package:product_list/screens/login.dart';
import 'package:product_list/screens/register.dart';

class AuthNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          // Switch to login screen
          if (state == AuthState.login)
            MaterialPage(
              child: Login(
                key: Key('login_screen'),
              ),
            ),
          // Switch to register screen
          if (state == AuthState.register)
            MaterialPage(
              child: Register(
                key: Key('register_screen'),
              ),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );  
    });
  }
}
