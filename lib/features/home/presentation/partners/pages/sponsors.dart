import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/data/repository/dio/dio_api_client.dart';
import 'package:ccd2023/features/home/presentation/partners/blocs/partners_cubit.dart';
import 'package:ccd2023/features/home/presentation/partners/repo/partners_repo.dart';
import 'package:ccd2023/utils/launch_url.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppCubit>().state.themeMode;

    return RepositoryProvider(
      create: (context) => PartnersRepository(
        context.read<DioApiClient>(),
      ),
      child: BlocProvider(
        create: (context) => PartnersCubit(
          context.read<PartnersRepository>(),
        )..getPartners(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenWidth! * 0.06),
              Text(
                'SPONSORS',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1
                        ..color = themeMode == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      // fontWeight: FontWeight.w600,
                    ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth! * 0.04),
                child: Text(
                  sponsorDesc,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(),
              BlocBuilder<PartnersCubit, PartnersState>(
                  builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const CircularProgressIndicator(
                    color: GCCDColor.googleBlue,
                  ),
                  loaded: (partners) {
                    return ListView.builder(
                        itemCount: partners.partners.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: screenWidth! * 0.04,
                                    horizontal: screenWidth! * 0.1),
                                child: Text(
                                  partners.partners[index].title!.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall,
                                ),
                              ),
                              Column(
                                children: partners.partners[index].sponsors!
                                    .map((sponsor) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: screenWidth! * 0.02),
                                          child: SponsorCard(
                                            title: partners.partners[index]
                                                .title!,
                                            imageUrl:
                                                "https://gdgcloud.kolkata.dev/ccd2023/images/sponsors/${sponsor!.imgSrc!}",
                                            url: sponsor.hyperlink!,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          );
                        });
                  },
                  error: (message) => const Text("Connect to Internet"),
                );
              }),
              SizedBox(height: screenWidth! * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth! * 0.04),
                child: Text(
                  'To become a sponsor, please email us at',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 14,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () {
                  launchExternalUrl('mailto: partners@gdgcloud.kolkata.dev');
                },
                child: Text(
                  'partners@gdgcloud.kolkata.dev',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: GCCDColor.googleBlue,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SponsorCard extends StatelessWidget {
  const SponsorCard({required this.imageUrl, required this.url, required this.title, Key? key})
      : super(key: key);

  final String imageUrl;
  final String url;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchExternalUrl(url);
      },
      child: Container(
        margin: title == "Title Sponsor"
            ? const EdgeInsets.all(0)
            : const EdgeInsets.symmetric(horizontal: kPadding * 7),
          padding: const EdgeInsets.symmetric(horizontal: kPadding * 2, vertical: 4),
          // color: Colors.white,
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: GCCDColor.googleRed,
                width: 4,
              ),
              bottom: BorderSide(
                color: GCCDColor.googleYellow,
                width: 4,
              ),
              left: BorderSide(
                color: GCCDColor.googleGreen,
                width: 4,
              ),
              right: BorderSide(
                color: GCCDColor.googleBlue,
                width: 4,
              ),
            ),
          ),
          child: imageUrl.endsWith('.svg')
              ? SvgPicture.network(
                  imageUrl,
                  fit: BoxFit.contain,
                )
              : Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                )),
    );
  }
}
