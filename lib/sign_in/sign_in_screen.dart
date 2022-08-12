import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_bloc/sign_in/bloc/sign_in_bloc.dart';
import 'package:tutorial_bloc/sign_in/bloc/sign_in_event.dart';
import 'package:tutorial_bloc/sign_in/bloc/sign_in_state.dart';

class SignInScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In With Email"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()
            ),
            children: [

              /// The text will have to change on the basis of state available
              /// so we wrap with BlocBuilder to use the Bloc
              /// Note* don't use const before Widget otherwise it will not show you Wrap with BlocBuilder
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  /// check if the state is error state then show the error text
                  if (state is SignInErrorState) {
                    return Text(state.errorMessage, style: TextStyle(
                      color: Colors.red,
                    ),);
                  }
                  else {
                    /// show empty container
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: emailController,
                /// Events will be fired from here when we change the text
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(emailController.text, passwordController.text)
                  );
                },
                decoration: InputDecoration(
                    hintText: "Email Address"
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Password"
                ),
              ),
              const SizedBox(height: 20,),

              /// Also the CupertinoButton will change
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return CupertinoButton(
                    onPressed: () {},
                    color: (state is SignInValidState) ? Colors.blue : Colors.grey,
                    child: Text("Sign In"),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
