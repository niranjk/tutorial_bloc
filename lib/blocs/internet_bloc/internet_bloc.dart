

import 'package:tutorial_bloc/blocs/internet_bloc/internet_event.dart';
import 'package:tutorial_bloc/blocs/internet_bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState>{
  // Step 1 : Initialise the Bloc
  // super initialises the Bloc i.e. the extended class
  // so we pass the Initial State in the super
  InternetBloc() : super(InternetInitialState()){
    // here we have to define the events and it's related states
    // on will check the events continuously
    // emit is a function that emits the states
    on<InternetFailedEvent> ((event, emit) => emit(InternetFailedState()) );
    on<InternetConnectedEvent>((event, emit) => emit(InternetConnectedState()));
  }
}