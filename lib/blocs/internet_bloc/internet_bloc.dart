

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:tutorial_bloc/blocs/internet_bloc/internet_event.dart';
import 'package:tutorial_bloc/blocs/internet_bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
/// Bloc Automatically Closes with the Page, so if the Screen is closed the Bloc closes
///
class InternetBloc extends Bloc<InternetEvent, InternetState>{
  // Step 1 : Initialise the Bloc
  // super initialises the Bloc i.e. the extended class
  // so we pass the Initial State in the super

  // connectivity package is used to add the event automatically and listen to results
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()){
    // here we have to define the events and it's related states
    // on will check the events continuously
    // Emitter emits the states
    on<InternetFailedEvent> ((event, emit) => emit(InternetFailedState()) );
    on<InternetConnectedEvent>((event, emit) => emit(InternetConnectedState()));

    /// listen to internet state and add events
    /// this listener can also runs in background so can affect the performance
    /// so we create connectivitySubscription to handle this and close this when bloc closes
    ///
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetConnectedEvent());
      }else {
        add(InternetFailedEvent());
      }
    });
  }

  // override Bloc method
  @override
  Future<void> close(){
    // here we cancel the connectivitySubscription
    connectivitySubscription?.cancel();
    return super.close();
  }
}