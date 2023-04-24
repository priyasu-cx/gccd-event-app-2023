import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/presentation/navigation/appbar.dart';
import 'package:ccd2023/features/connecten/bloc/connecten_cubit.dart';
import 'package:ccd2023/features/home/presentation/default_button_widget.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:nearby_connections/nearby_connections.dart';

class ConnectenHomePage extends StatefulWidget {
  const ConnectenHomePage({Key? key}) : super(key: key);

  @override
  State<ConnectenHomePage> createState() => _ConnectenHomePageState();
}

class _ConnectenHomePageState extends State<ConnectenHomePage>
    with TickerProviderStateMixin {
  // final NearbyConnectionBloc _nearbyConnectionBloc = NearbyConnectionBloc();
  final ConnectionCubit _connectenCubit = ConnectionCubit();

  @override
  void dispose() async {
    // _nearbyConnectionBloc.close();
    super.dispose();
    await _connectenCubit.close();
  }

  // create function checkPermission
  void checkPermission() async {
    bool isLocationPermission = await Nearby().checkLocationPermission();
    bool isBluetoothPermission = await Nearby().checkBluetoothPermission();
    bool isLocationEnabled = await Nearby().checkLocationEnabled();

    if (!isLocationPermission) {
      await Nearby().askLocationPermission();
    }
    if (!isBluetoothPermission) {
      Nearby().askBluetoothPermission();
    }
    if (!isLocationEnabled) {
      await Nearby().enableLocationServices();
    }
  }

  @override
  Widget build(BuildContext context) {
    checkPermission();

    // context.read<ConnectenCubit>().startAdvertising();
    return SafeArea(
      top: true,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 0.07),
            child: const CCDAppBar(showActions: false, showDrawer: false),
          ),
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Image.asset(GCCDImageAssets.backgroundGraphics,
                    width: screenWidth!),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        // Text(
                        //   "GCCD Kol'23",
                        //   style: Theme.of(context).textTheme.displaySmall?.copyWith(color: GCCDColor.googleYellow),
                        // ),
                        // Text("X", style: Theme.of(context).textTheme.displaySmall),
                        Image.asset(GCCDImageAssets.connectenLogo,
                            width: screenWidth! * 0.1),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            text: "Connec",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: GCCDColor.googleBlue),
                            children: [
                              TextSpan(
                                text: "Ten",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "One-tap solution for fast, secure,\nhassle-free networking.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: GCCDColor.googleYellow),
                  ),
                  // SizedBox(height: screenHeight! * 0.13),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight! * 0.12,
                        horizontal: screenWidth! * 0.08),
                    child: RippleWave(
                      color: Colors.white,
                      childTween: Tween(begin: 0.9, end: 1),
                      child: Image.asset(GCCDImageAssets.yoda,
                          width: screenWidth! * 0.45),
                    ),
                  ),
                  BlocProvider(
                      create: (context) => ConnectionCubit(),
                      child: BlocBuilder<ConnectionCubit, ConnectenState>(
                        builder: (context, state) {
                          context.read<ConnectionCubit>().setCycle();

                          return SizedBox(
                              // width: screenWidth! * 0.6,
                              // child: DefaultButton(
                              //   isOutlined: false,
                              //   text: "Start Networking",
                              //   onPressed: () {
                              //     context.read<ConnectenCubit>().startCycle();
                              //   },
                              // ),
                              );
                        },
                      )),
                  // BlocBuilder<ConnectenCubit, ConnectenState>(
                  //   builder: (context, state) {
                  //     context.read<ConnectenCubit>().startAdvertising();
                  //     return Container();
                  //   },
                  // ),
                  SizedBox(
                    width: screenWidth! * 0.6,
                    child: DefaultButton(
                      isOutlined: true,
                      text: "Nearby Connections",
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("This is a limited access feature",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: GCCDColor.googleBlue))
                ],
              ),
            ],
          )),
    );
  }
}
