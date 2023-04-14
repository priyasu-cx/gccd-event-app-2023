import 'package:auto_route/auto_route.dart';
import 'package:ccd2023/configurations/router/ccd_router.gr.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:ccd2023/features/home/presentation/default_button_widget.dart';
import 'package:ccd2023/features/profile/bloc/edit_profile_cubit.dart';
import 'package:ccd2023/features/tickets/bloc/ticket_cubit.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubit>().state.user;
    return BlocBuilder<EditProfileCubit, EditState>(
      builder: (context, state) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth! * 0.4,
                child: BlocBuilder<TicketCubit, TicketState>(
                  builder: (context, state) {
                    return DefaultButton(
                      text: state.hasTickets ? 'View Ticket' : 'Buy Ticket',
                      backgroundColor: GCCDColor.googleGreen,
                      withIcon: true,
                      icon: Icons.local_activity_outlined,
                      isOutlined: true,
                      onPressed: () {
                        !state.hasTickets
                            ? context.router.push(const BuyTicketRoute())
                            : context.router.push(
                                ViewTicketRoute(ticket: state.ticket!),
                              );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                  width: screenWidth! * 0.4,
                  child: DefaultButton(
                    text: state.isEditing ? 'Cancel' : 'Edit Profile',
                    backgroundColor:
                        user!.profile.profileLock ? GCCDColor.googleGrey :
                        state.isEditing ? Colors.black12 : GCCDColor.googleBlue,
                    withIcon: true,
                    icon: state.isEditing
                        ? Icons.cancel_outlined
                        : Icons.edit_note_outlined,
                    isOutlined: true,
                    onPressed: () {
                      final ticketState = context.read<TicketCubit>().state;

                      if (user.profile.profileLock) {
                        DjangoflowAppSnackbar.showError(
                            "Your profile is locked. Please contact at gdgcloudkol@gmail.com to make changes.");
                        return;
                      } else if (ticketState.hasTickets &&
                          !user.profile.profileLock &&
                          !state.isEditing) {
                        DjangoflowAppSnackbar.showInfo(
                            "Your profile will be auto-locked on April 21st, 2023. Please make necessary changes before that.");
                      }
                      context.read<EditProfileCubit>().toggleEditing();
                      if (state.isEditing) {
                        context.router.popAndPush(const ProfileRoute());
                      }
                    },
                  ))
            ]);
      },
    );
  }
}
