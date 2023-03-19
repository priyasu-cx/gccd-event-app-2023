import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/features/app/presentation/navigation/appbar.dart';
import 'package:ccd2023/features/app/presentation/navigation/drawer.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';

class CoCPage extends StatelessWidget {
  const CoCPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight! * 0.07),
          child: const CCDAppBar(),
        ),
        drawer: const CCDDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth! * 0.08),
                child: Text(
                  CoCDetails["title"].toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: GCCDColor.googleGreen, fontSize: 28),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.08),
                child: Text(
                  CoCDetails["description"].toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: int.parse(CoCDetails['length'].toString()),
                  itemBuilder: (context, index) {
                    return GetSingleCoCWidget(
                      title: CoCTitle[index],
                      body: CoCAnswers[index],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class GetSingleCoCWidget extends StatelessWidget {
  const GetSingleCoCWidget({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: 8, horizontal: screenWidth! * 0.08),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Text(
              body,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
