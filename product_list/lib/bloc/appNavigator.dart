import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/auth/authCubit.dart';
import 'package:product_list/bloc/auth/authNavigator.dart';
import 'package:product_list/bloc/session/sessionCubit.dart';
import 'package:product_list/bloc/sessionState.dart';
import 'package:product_list/screens/loading.dart';
import 'package:product_list/screens/product/productListScreen.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is UnknownSessionState)
            MaterialPage(
              child: LoadingScreen(),
            ),
          if (state is Unauthenticated)
            MaterialPage(
              child: BlocProvider(
                create: (context) =>
                    AuthCubit(sessionCubit: context.read<SessionCubit>()),
                child: AuthNavigator(),
              ),
            ),
          if (state is Authenticated)
            MaterialPage(
              child: ProductListSceen(
                  key: Key('product_list_screen'), sessionId: state.sessionId),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
