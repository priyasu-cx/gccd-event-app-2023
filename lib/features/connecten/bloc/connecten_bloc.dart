// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nearby_connections/nearby_connections.dart';
//
// // Define the events for the NearbyConnectionBloc
// abstract class NearbyConnectionEvent {}
//
// class StartNearbyConnection extends NearbyConnectionEvent {}
//
// class StopNearbyConnection extends NearbyConnectionEvent {}
//
// // Define the states for the NearbyConnectionBloc
// abstract class NearbyConnectionState {}
//
// class NearbyConnectionIdle extends NearbyConnectionState {}
//
// class NearbyConnectionInProgress extends NearbyConnectionState {}
//
// class NearbyConnectionEstablished extends NearbyConnectionState {}
//
// class NearbyConnectionFailed extends NearbyConnectionState {}
//
// // Define the NearbyConnectionBloc
// class NearbyConnectionBloc
//     extends Bloc<NearbyConnectionEvent, NearbyConnectionState> {
//   final String _serviceId = "com.gdgck.gccd";
//   Timer? _timer;
//   bool _isAdvertising = false;
//   bool _isDiscovering = false;
//
//   NearbyConnectionBloc() : super(NearbyConnectionIdle());
//
//   @override
//   Stream<NearbyConnectionState> mapEventToState(
//     NearbyConnectionEvent event,
//   ) async* {
//     if (event is StartNearbyConnection) {
//       yield* _mapStartNearbyConnectionToState();
//     } else if (event is StopNearbyConnection) {
//       yield* _mapStopNearbyConnectionToState();
//     }
//   }
//
//   Stream<NearbyConnectionState> _mapStartNearbyConnectionToState() async* {
//     emit(NearbyConnectionInProgress());
//     try {
//       if (!_isAdvertising) {
//         await Nearby().startAdvertising(
//           "Hello World",
//           Strategy.P2P_STAR,
//           onConnectionInitiated:
//               (String endpointId, ConnectionInfo connectionInfo) {
//             // Handle connection initiation request
//           },
//           onConnectionResult: (String endpointId, Status status) {
//             // Handle connection result
//           },
//           onDisconnected: (String endpointId) {
//             // Handle disconnection
//           },
//           serviceId: _serviceId,
//         );
//         _isAdvertising = true;
//       }
//       if (!_isDiscovering) {
//         await Nearby().startDiscovery(
//           "Hello Discovery",
//           Strategy.P2P_STAR,
//           onEndpointFound:
//               (String endpointId, String endpointName, String serviceId) {
//             // Handle endpoint found
//           },
//           onEndpointLost: (String? endpointId) {
//             // Handle endpoint lost
//           },
//           serviceId: _serviceId,
//         );
//         _isDiscovering = true;
//       }
//       _startTimer();
//       emit(NearbyConnectionEstablished());
//     } catch (e) {
//       emit(NearbyConnectionFailed());
//     }
//   }
//
//   Stream<NearbyConnectionState> _mapStopNearbyConnectionToState() async* {
//     emit(NearbyConnectionIdle());
//     if (_isAdvertising) {
//       await Nearby().stopAdvertising();
//       _isAdvertising = false;
//     }
//     if (_isDiscovering) {
//       await Nearby().stopDiscovery();
//       _isDiscovering = false;
//     }
//     _stopTimer();
//   }
//
//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 15), (_) {
//       add(StopNearbyConnection());
//       add(StartNearbyConnection());
//     });
//   }
//
//   void _stopTimer() {
//     _timer?.cancel();
//   }
// }
