import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:ccd2023/features/profile/bloc/edit_profile_cubit.dart';
import 'package:ccd2023/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthCubit>().state.user;
    final isEditing = context.watch<EditProfileCubit>().state.isEditing;

    return user?.profile.socials.isNotEmpty ?? false
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              user?.profile.socials['instagram'] != null
                  ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          launchExternalUrl(
                              user!.profile.socials['instagram']!);
                        },
                        child: const Icon(
                          FontAwesome5.instagram,
                        ),
                      ),
                    )
                  : const Offstage(),
              user?.profile.socials['linkedin'] != null
                  ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          launchExternalUrl(user!.profile.socials['linkedin']!);
                        },
                        child: const Icon(
                          FontAwesome5.linkedin,
                        ),
                      ),
                    )
                  : const Offstage(),
              user?.profile.socials['github'] != null
                  ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          launchExternalUrl(user!.profile.socials['github']!);
                        },
                        child: const Icon(
                          FontAwesome5.github,
                        ),
                      ),
                    )
                  : const Offstage(),
              user?.profile.socials['facebook'] != null
                  ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          launchExternalUrl(user!.profile.socials['facebook']!);
                        },
                        child: const Icon(
                          FontAwesome5.facebook,
                        ),
                      ),
                    )
                  : const Offstage(),
              user?.profile.socials['website'] != null
                  ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          launchExternalUrl(user!.profile.socials['website']!);
                        },
                        child: const Icon(
                          FontAwesome5.globe_asia,
                        ),
                      ),
                    )
                  : const Offstage()
            ],
          )
        : const Offstage();
  }
}
