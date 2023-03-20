import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
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
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        FontAwesome5.instagram,
                      ),
                    )
                  : const Offstage(),
              user?.profile.socials['linkedin'] != null
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        FontAwesome5.linkedin,
                      ),
                    )
                  : const Offstage(),
              user?.profile.socials['github'] != null
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        FontAwesome5.github,
                      ),
                    )
                  : const Offstage(),
              user?.profile.socials['facebook'] != null
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        FontAwesome5.facebook,
                      ),
                    )
                  : const Offstage(),
              user?.profile.socials['website'] != null
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        FontAwesome5.globe_asia,
                      ),
                    )
                  : const Offstage()
            ],
          )
        : const Offstage();
  }
}
