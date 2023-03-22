import 'package:auto_route/auto_route.dart';
import 'package:ccd2023/configurations/router/ccd_router.gr.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/features/home/presentation/default_button_widget.dart';
import 'package:ccd2023/features/profile/bloc/edit_profile_cubit.dart';
import 'package:ccd2023/features/tickets/bloc/ticket_cubit.dart';
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
                        state.isEditing ? Colors.black12 : GCCDColor.googleBlue,
                    withIcon: true,
                    icon: state.isEditing
                        ? Icons.cancel_outlined
                        : Icons.edit_note_outlined,
                    isOutlined: true,
                    onPressed: () {
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
