import 'package:auto_route/auto_route.dart';
import 'package:ccd2023/configurations/router/ccd_router.gr.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/features/home/presentation/default_button_widget.dart';
import 'package:ccd2023/features/profile/bloc/edit_profile_cubit.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditState>(
      builder: (context, state) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth! * 0.4,
                child: state.isEditing
                    ? DefaultButton(
                        text: 'Save ',
                        backgroundColor: GCCDColor.googleGreen,
                        withIcon: true,
                        icon: Icons.save_outlined,
                        isOutlined: true,
                        onPressed: () {},
                      )
                    : DefaultButton(
                        text: 'Buy Tickets',
                        backgroundColor: GCCDColor.googleGreen,
                        withIcon: true,
                        icon: Icons.local_activity_outlined,
                        isOutlined: true,
                        onPressed: () {
                          context.router.push(const BuyTicketRoute());
                        },
                      ),
              ),
              SizedBox(
                  width: screenWidth! * 0.4,
                  child: DefaultButton(
                    text: state.isEditing ? 'Cancel' : 'Edit Profile',
                    backgroundColor:
                        state.isEditing ? Colors.black12 : GCCDColor.googleBlue,
                    withIcon: true,
                    icon: state.isEditing
                        ? Icons.cancel_outlined
                        : Icons.edit_note_outlined,
                    isOutlined: true,
                    onPressed: () {
                      context.read<EditProfileCubit>().toggleEditing();
                    },
                  ))
            ]);
      },
    );
  }
}
