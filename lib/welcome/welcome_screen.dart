import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_bloc/sign_in/bloc/sign_in_bloc.dart';
import 'package:tutorial_bloc/sign_in/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: CupertinoButton(
                    onPressed: () {
                      /// Now we have to use the SignInBloc so we have to provide the Bloc to the SignInScreen
                      /// So we wrap with BlocProvider and provide the SignInBloc before navigating to SignInScreen
                      /// now the SignInBloc will be available in SignInScreen
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>
                          BlocProvider(
                            create: (context) => SignInBloc(),
                            child: SignInScreen(),
                          )));
                    },
                    color: Colors.blue,
                    child: const Text("Sign In With Email"),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
