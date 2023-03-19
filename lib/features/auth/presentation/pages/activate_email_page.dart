import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progress_builder/progress_builder.dart';

class ActivateEmailPage extends StatelessWidget {
  final String title;
  final String message;

  const ActivateEmailPage({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.1),
              child: Column(
                children: [
                  SizedBox(height: screenHeight! * 0.1),
                  SvgPicture.asset(
                    GCCDImageAssets.victoriaSVGImage,
                    width: screenWidth! * 0.8,
                  ),
                  SizedBox(height: screenHeight! * 0.08),
                  Center(
                    child: Text(
                      message,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kPadding * 2,
                    ),
                    child: Center(
                      child: CircularProgressBuilder(
                        builder: (context, action, error) => ElevatedButton(
                          onPressed: () {
                            context.router.replace(const LoginRoute());
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(kPadding * 1.5),
                              child: Text(
                                "Login to your Account",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
