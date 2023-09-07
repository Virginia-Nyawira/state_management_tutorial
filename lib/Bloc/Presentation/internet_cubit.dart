import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:states/constants.dart';

part 'internet_state.dart';

//utilizes connection_type package

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {

    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
          if(connectivityResult==ConnectivityResult.wifi){
            emitInternetConnected(ConnectivityType.wifi);
          }
          else if(connectivityResult==ConnectivityResult.mobile){
            emitInternetConnected(ConnectivityType.mobile);
          }
          else if(connectivityResult==ConnectivityResult.none){
            emitInternetDisconnected();
          }

        });

  }
  //Methods to emit created internet states

  void emitInternetConnected(ConnectivityType _connectivityType) =>
      emit(InternetConnected(connectivityType: _connectivityType));

  void emitInternetDisconnected()=> emit(InternetDisconnected());

  @override
  Future<void> close(){
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
