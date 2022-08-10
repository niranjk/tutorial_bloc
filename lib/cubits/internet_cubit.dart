
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// If your classes has no attributes and constructors then
/// it can be defined as enums
/// so we create a IntenetCubitState as a enum class

enum InternetCubitState { Initial, Lost, Gained}


class InternetCubit extends Cubit<InternetCubitState>{
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit(): super( InternetCubitState.Initial ){
     connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
        if ( result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
          emit(InternetCubitState.Gained);
        }
        else {
          emit(InternetCubitState.Lost);
        }
     });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}