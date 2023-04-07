import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:ccd2023/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthCubit>().state.user;

    return user?.profile.socials.isNotEmpty ?? false
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              user?.profile.socials['instagram'] != null
                  ? _SocialIcon(
                      link: user!.profile.socials['instagram']!,
                      icon: FontAwesome5.instagram,
                    )
                  : const Offstage(),
              user?.profile.socials['twitter'] != null
                  ? _SocialIcon(
                      link: user!.profile.socials['twitter']!,
                      icon: FontAwesome5.twitter,
                    )
                  : const Offstage(),
              user?.profile.socials['linkedin'] != null
                  ? _SocialIcon(
                      link: user!.profile.socials['linkedin']!,
                      icon: FontAwesome5.linkedin,
                    )
                  : const Offstage(),
              user?.profile.socials['github'] != null
                  ? _SocialIcon(
                      link: user!.profile.socials['github']!,
                      icon: FontAwesome5.github,
                    )
                  : const Offstage(),
              user?.profile.socials['facebook'] != null
                  ? _SocialIcon(
                      link: user!.profile.socials['facebook']!,
                      icon: FontAwesome5.facebook,
                    )
                  : const Offstage(),
              user?.profile.socials['website'] != null
                  ? _SocialIcon(
                      link: user!.profile.socials['website']!,
                      icon: FontAwesome5.globe_asia,
                    )
                  : const Offstage()
            ],
          )
        : const Offstage();
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({Key? key, required this.link, required this.icon})
      : super(key: key);

  final String link;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: InkWell(
        onTap: () {
          launchExternalUrl(link);
        },
        child: Icon(icon),
      ),
    );
  }
}
