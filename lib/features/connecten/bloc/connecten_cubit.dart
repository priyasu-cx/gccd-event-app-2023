import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nearby_connections/nearby_connections.dart';

part 'connecten_state.dart';
part 'connecten_cubit.freezed.dart';

class ConnectionCubit extends Cubit<ConnectenState> {
  ConnectionCubit() : super(const ConnectenState.initial()) {
    _initialize();
  }

  final Strategy strategy = Strategy.P2P_STAR;
  final String serviceId = "com.gdgck.gccd";
  final String endpointName = "Hello World";
  var permissionState = false;

  Future checkPermissions() async {
    await getBluetoothPermission();
    await getLocationPermission();
    await checkLocationEnabled();

    bool isBluetoothPermission = await Nearby().checkBluetoothPermission();
    bool isLocationPermission = await Nearby().checkLocationPermission();
    bool isLocationEnabled = await Nearby().checkLocationEnabled();

    if (isLocationEnabled && isBluetoothPermission && isLocationPermission) {
      permissionState = true;
    } else {
      permissionState = false;
      // setCycle();
    }
  }

  Future getLocationPermission() async {
    if (await Nearby().checkLocationPermission() == false) {
      await Nearby().askLocationPermission();
    }
  }

  Future getBluetoothPermission() async {
    if (await Nearby().checkBluetoothPermission() == false) {
      Nearby().askBluetoothPermission();
    }
  }

  Future checkLocationEnabled() async {
    if (await Nearby().checkLocationEnabled() == false) {
      await Nearby().enableLocationServices();
    }
  }

  void _initialize() async {
    // Code to run on initialization
    await checkPermissions();
  }

  void setCycle() {
    print(permissionState);
    if (permissionState) {
      startDiscovery();
    } else {
      checkPermissions();
    }
  }

  void startAdvertising() async {
    emit(const ConnectenState.advertising());
    print("startAdvertising");
    await Nearby().startAdvertising(
      endpointName,
      strategy,
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
      serviceId: serviceId,
    );
  }

  void startDiscovery() async {
    emit(const ConnectenState.discovering());
    print("startDiscovery");
    await Nearby().startDiscovery(
      endpointName,
      strategy,
      onEndpointFound:
          (String endpointId, String serviceId, String endpointName) {
        // Handle endpoint found
      },
      onEndpointLost: (String? endpointId) {
        // Handle endpoint lost
      },
      serviceId: serviceId,
    );
  }
}


// class ConnectenCubit extends Cubit<ConnectenState> {
//   ConnectenCubit() : super(const ConnectenState.initial());

//   final Strategy strategy = Strategy.P2P_STAR;
//   final String serviceId = "com.gdgck.gccd";
//   final String endpointName = "Hello World";

//   @override
//   Future<void> close() async {
//     await Nearby().stopAdvertising();
//     await Nearby().stopDiscovery();
//     await Nearby().stopAllEndpoints();
//     super.close();
//   }

//   void startAdvertising() async {
//     emit(const ConnectenState.advertising());
//     print("startAdvertising");
//     await Nearby().startAdvertising(
//       endpointName,
//       strategy,
//       onConnectionInitiated:
//           (String endpointId, ConnectionInfo connectionInfo) {
//         // Handle connection initiation request
//       },
//       onConnectionResult: (String endpointId, Status status) {
//         // Handle connection result
//       },
//       onDisconnected: (String endpointId) {
//         // Handle disconnection
//       },
//       serviceId: serviceId,
//     );
//   }

//   void startDiscovery() async {
//     emit(const ConnectenState.discovering());
//     print("startDiscovery");
//     await Nearby().startDiscovery(
//       endpointName,
//       strategy,
//       onEndpointFound:
//           (String endpointId, String serviceId, String endpointName) {
//         // Handle endpoint found
//       },
//       onEndpointLost: (String? endpointId) {
//         // Handle endpoint lost
//       },
//       serviceId: serviceId,
//     );
//   }

//   void startCycle() {
//     Timer.periodic(Duration(seconds: 10), (timer) async {
//       print(state.runtimeType);
//       switch (state.runtimeType) {
//         case _Initial:
//           // This should start the discovery
//           // and stops nothing
//           print(
//               "Initial State ------------------------------------------------------------------ 1");
//           // sleep(Duration(seconds: 2));
//           // await Nearby().stopAdvertising();
//           startDiscovery();
//           // sleep(Duration(seconds: 30));
//           break;
//         case _Advertising:
//           // This should stop the advertising
//           // and start the discovery cycle
//           print(
//               "Advertising State ------------------------------------------------------------------ 2");
//           // sleep(Duration(seconds: 2));
//           await Nearby().stopAdvertising();
//           startDiscovery();
//           // sleep(Duration(seconds: 15));
//           break;
//         case _Discovering:
//           // This should stop the discovery
//           // and start the advertising cycle
//           print(
//               "Discovery State ------------------------------------------------------------------ 3");
//           // sleep(Duration(seconds: 2));
//           await Nearby().stopDiscovery();
//           startAdvertising();
//           // sleep(Duration(seconds: 15));
//           break;

//         default:
//           print(
//               "Default State ------------------------------------------------------------------ 4");
//           print(state.runtimeType);
//           break;
//       }
//       // if(state is _Initial){
//       //   print("Initial State ------------------------------------------------------------------ 1");
//       //   // sleep(Duration(seconds: 2));
//       //   startDiscovery();
//       //   sleep(Duration(seconds: 30));
//       // } else if(state is _Advertising){
//       //   print("Advertising State ------------------------------------------------------------------ 2");
//       //   sleep(Duration(seconds: 2));
//       //   Nearby().stopAdvertising();
//       //   startDiscovery();
//       //   sleep(Duration(seconds: 30));
//       // }
//       // else if(state is _Discovering){
//       //   print("Discovery State ------------------------------------------------------------------ 3");
//       //   sleep(Duration(seconds: 2));
//       //   Nearby().stopDiscovery();
//       //   startAdvertising();
//       //   sleep(Duration(seconds: 30));
//       // }
//     });
//   }
// }
