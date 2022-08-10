import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_bloc/cubits/internet_cubit.dart';

import 'cubits/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        /// --------------------- Cubit ---------------------------------------
        child: BlocConsumer<InternetCubit, InternetCubitState>(
          listener: (context, state) {
            // Implement listener which checks in background
            if ( state ==  InternetCubitState.Gained){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet Connected !"),
                  backgroundColor: Colors.green,
                ),
              );
            }
            else if( state ==  InternetCubitState.Lost){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet Disconnected !"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            // show the UI part here
            if (state == InternetCubitState.Gained){
              return Text("Connected");
            }
            else if ( state == InternetCubitState.Lost){
              return Text("Disconnected");
            }
            else {
              return Text("Loading");
            }
          },
        ),
        /*
        ------------------------------------Bloc -------------------------------
        /// What If I wanna show a SnackBar or Dialog ??
        /// So we use BlocListener
        /// BlocListeners are useful for Background tasks but don't show the UI
        /// So for Both Use case : Making UI and doing Background Task of Listening to State we use BlocConsumer
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            // Implement listener which checks in background
            if ( state is InternetConnectedState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Internet Connected !"),
                  backgroundColor: Colors.green,
                ),
              );
            }
            else if( state is InternetFailedState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet Disconnected !"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            // show the UI part here 
            if (state is InternetConnectedState){
              return Text("Connected");
            }
            else if ( state is InternetFailedState){
              return Text("Disconnected");
            }
            else {
              return Text("Loading");
            }
          },
        ),
         ------------------------------------- Bloc -----------------------
         */
        /*
          child: Center(
            /// Now wrap the Text widget with the BlocBuilder
            /// Given the Bloc if there is any changes in state it notifies to this widget
            /// BlocBuilder makes the UI ...
            child: BlocBuilder<InternetBloc, InternetState>(
              builder: (context, state) {
                /// == check values
                /// is to chech DataType
                if (state is InternetConnectedState){
                  return Text("Connected");
                }
                else if ( state is InternetFailedState){
                  return Text("Disconnected");
                }
                else {
                  return Text("Loading");
                }
              },
            ),
          )

         */
      ),
    );
  }
}
