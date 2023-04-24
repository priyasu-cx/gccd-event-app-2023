import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nearby_connections/nearby_connections.dart';

part 'connecten_state.dart';
part 'connecten_cubit.freezed.dart';

class ConnectenCubit extends Cubit<ConnectenState> {
  ConnectenCubit() : super(const ConnectenState.initial());

  @override
  Future<void> close() async{
    await Nearby().stopAdvertising();
    await Nearby().stopDiscovery();
    await Nearby().stopAllEndpoints();
    super.close();
  }

  void startAdvertising() async {
    emit(const ConnectenState.advertising());
    print("startAdvertising");
    await Nearby().startAdvertising(
      "Hello World",
      Strategy.P2P_STAR,
      onConnectionInitiated:
          (String endpointId, ConnectionInfo connectionInfo) {
        // Handle connection initiation request
      },
      onConnectionResult: (String endpointId, Status status) {
        // Handle connection result
      },
      onDisconnected: (String endpointId) {
        // Handle disconnection
      },
      serviceId: "com.gdgck.gccd",
    );
  }

  void startDiscovery() async {
    emit(const ConnectenState.discovering());
    print("startDiscovery");
    await Nearby().startDiscovery(
      "Hello World",
      Strategy.P2P_STAR,
      onEndpointFound: (String endpointId, String serviceId, String endpointName) {
        // Handle endpoint found
      },
      onEndpointLost: (String? endpointId) {
        // Handle endpoint lost
      },
      serviceId: "com.gdgck.gccd",
    );
  }

  void startCycle(){

    Timer.periodic(Duration(seconds: 30), (timer) {
      // print(state);
      if(state is _Initial){
        print("Initial State ------------------------------------------------------------------ 1");
        // sleep(Duration(seconds: 2));
        startDiscovery();
        sleep(Duration(seconds: 30));
      } else if(state is _Advertising){
        print("Advertising State ------------------------------------------------------------------ 2");
        sleep(Duration(seconds: 2));
        Nearby().stopAdvertising();
        startDiscovery();
        sleep(Duration(seconds: 30));
      }
      else if(state is _Discovering){
        print("Discovery State ------------------------------------------------------------------ 3");
        sleep(Duration(seconds: 2));
        Nearby().stopDiscovery();
        startAdvertising();
        sleep(Duration(seconds: 30));
      }
    });
  }
}
