import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nearby_connections/nearby_connections.dart';

part 'connecten_state.dart';
part 'connecten_cubit.freezed.dart';

class ConnectenCubit extends Cubit<ConnectenState> {
  late Timer _timer;
  ConnectenCubit() : super(const ConnectenState.initial()) {
    _timer = Timer.periodic(Duration(seconds: 10), (_) async {
      switch(state.runtimeType){
        case _$_Initial:
          break;
        case _$_Advertising:
          print("Advertising State ------------------------------------------------------------------ 2");
          // sleep(Duration(seconds: 2));
          await Nearby().stopAdvertising();
          startDiscovery();
          break;
        case _$_Discovering:
          print("Discovering State ------------------------------------------------------------------ 3");
          // sleep(Duration(seconds: 2));
          await Nearby().stopDiscovery();
          startAdvertising();
          break;
        default:
          print("Default State ------------------------------------------------------------------ n");
          break;
      }
    });
  }
  bool permissionState = false;
  Strategy strategy = Strategy.P2P_STAR;
  String _serviceId = "com.gdgck.gccd";

  @override
  Future<void> close() async{
    await Nearby().stopAdvertising();
    await Nearby().stopDiscovery();
    await Nearby().stopAllEndpoints();
    _timer.cancel();
    return super.close();
  }

  void initialize() async {
    Nearby().stopAllEndpoints();
    checkPermission();
    emit(ConnectenState.discovering());
    print("Initialize State $state");
  }

  void checkPermission() async {
    print("Initial state $state");
    bool isLocationPermission = await Nearby().checkLocationPermission();
    bool isBluetoothPermission = await Nearby().checkBluetoothPermission();
    bool isLocationEnabled = await Nearby().checkLocationEnabled();

    if(!isLocationPermission) {
      Nearby().askLocationPermission();
    }
    if(!isBluetoothPermission) {
      Nearby().askBluetoothPermission();
    }
    if(!isLocationEnabled) {
      Nearby().enableLocationServices();
    }

    if(isLocationPermission && isBluetoothPermission && isLocationEnabled){
      permissionState = true;
      // emit(const ConnectenState.initial());
      print("Permission granted $state");
      // startCycle();
      // startDiscovery();
    } else {
      checkPermission();
    }
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
      serviceId: _serviceId,
    );
  }

  void startDiscovery() async {
    print("Start Discovery State: $state");
    emit(const ConnectenState.discovering());
    // print("startDiscovery");
    await Nearby().startDiscovery(
      "Hello World",
      Strategy.P2P_STAR,
      onEndpointFound: (String endpointId, String serviceId, String endpointName) {
        // Handle endpoint found
        DjangoflowAppSnackbar.showInfo("Endpoint found: $endpointName");
      },
      onEndpointLost: (String? endpointId) {
        // Handle endpoint lost
      },
      serviceId: _serviceId,
    );
  }
}
