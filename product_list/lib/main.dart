import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/appNavigator.dart';
import 'package:product_list/bloc/auth/authRepository.dart';
import 'package:product_list/bloc/session/sessionCubit.dart';
import 'package:product_list/theme/colours.dart';
import 'package:product_list/theme/productListTheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ProductListTheme.standardTheme.copyWith(
        scaffoldBackgroundColor: Colours.darkblue,
      ),
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) => SessionCubit(),
          child: AppNavigator(),
        ),
      ),
    );
  }
}
