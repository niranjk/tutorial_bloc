import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_bloc/sign_in/bloc/sign_in_bloc.dart';
import 'package:tutorial_bloc/sign_in/sign_in_screen.dart';
import 'package:tutorial_bloc/welcome/welcome_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/welcome":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SignInBloc(),
                  child: WelcomeScreen(),
                ));
      case "/signIn":
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SignInBloc(),
                  child: SignInScreen(title: args["title"],),
                ));
      default : return null;
    }
  }
}
