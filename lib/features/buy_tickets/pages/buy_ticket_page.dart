import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/presentation/navigation/appbar.dart';
import 'package:ccd2023/features/app/presentation/navigation/drawer.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:ccd2023/features/profile/bloc/edit_profile_cubit.dart';
import 'package:ccd2023/features/profile/pages/edit_profile_page.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/launch_buy_ticket.dart';
import '../../home/presentation/default_button_widget.dart';

class BuyTicketPage extends StatelessWidget {
  const BuyTicketPage({Key? key}) : super(key: key);

  FormGroup _formBuilder() {
    final user = AuthCubit.instance.state.user;

    return fb.group(
      {
        emailControlName: FormControl<String>(
          value: user?.email,
          validators: [Validators.required, Validators.email],
        ),
        firstNameControlName: FormControl<String>(
          value: user?.profile.firstName,
          validators: [Validators.required],
        ),
        lastNameControlName: FormControl<String>(
          value: user?.profile.lastName,
          validators: [Validators.required],
        ),
        phoneControlName: FormControl<String>(
          value: user?.profile.phone,
          validators: [Validators.required],
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppCubit>().state.themeMode;
    final user = context.read<AuthCubit>().state.user;

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.08),
            child: BlocProvider<EditProfileCubit>(
              create: (context) => EditProfileCubit(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenWidth! * 0.08),
                    child: Text(
                      'Buy Tickets 🎫',
                      style: TextStyle(
                        fontSize: screenWidth! * 0.09,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = themeMode == ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                      ),
                    ),
                  ),
                  EditProfileWrapper(
                    onSubmit: (form) {
                      if (kDebugMode) {
                        print(form.value);
                      }
                      throw UnimplementedError();
                    },
                    formBuilder: _formBuilder,
                    formContent: [
                      // Email
                      const Text(
                        "Email",
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 6),
                      ReactiveTextField(
                        formControlName: emailControlName,
                        autofillHints: const [AutofillHints.email],
                        validationMessages: {
                          ValidationMessage.required: (_) =>
                              'Email cannot be empty',
                          ValidationMessage.email: (_) => 'Email is not valid',
                        },
                      ),
                      const SizedBox(height: 20),

                      // First Name
                      const Text(
                        "First Name",
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 6),
                      ReactiveTextField(
                        formControlName: firstNameControlName,
                        validationMessages: {
                          ValidationMessage.required: (_) =>
                              'First Name cannot be empty',
                        },
                      ),
                      const SizedBox(height: 20),

                      // Last Name
                      const Text(
                        "Last Name",
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 6),
                      ReactiveTextField(
                        formControlName: lastNameControlName,
                        validationMessages: {
                          ValidationMessage.required: (_) =>
                              'Last Name cannot be empty',
                        },
                      ),
                      const SizedBox(height: 20),

                      // Phone Number
                      const Text(
                        "Phone Number",
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 6),
                      ReactiveTextField(
                        formControlName: phoneControlName,
                        autofillHints: const [AutofillHints.telephoneNumber],
                        validationMessages: {
                          ValidationMessage.minLength: (_) =>
                              'Enter a valid phone number',
                          ValidationMessage.maxLength: (_) =>
                              'Enter a valid phone number',
                          ValidationMessage.number: (_) =>
                              'Enter a valid phone number',
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                    editButtonText: "Save",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenWidth! * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth! * 0.4,
                          child: DefaultButton(
                            text: 'Buy Tickets',
                            backgroundColor: GCCDColor.googleGreen,
                            withIcon: true,
                            icon: Icons.local_activity_outlined,
                            isOutlined: true,
                            onPressed: () {
                              if (user == null) {
                                DjangoflowAppSnackbar.showInfo(
                                    'Session Expired. Please login again.');
                                context.read<AuthCubit>().logout();
                              } else if (user.profile.phone == null) {
                                DjangoflowAppSnackbar.showError(
                                  'Please complete profile using edit profile option.',
                                );
                              } else {
                                launchBuyTicket(
                                  user.profile.firstName,
                                  user.profile.lastName,
                                  user.email,
                                  user.profile.phone!,
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: screenWidth! * 0.4,
                          child: BlocBuilder<EditProfileCubit, EditState>(
                            builder: (context, state) {
                              return DefaultButton(
                                text:
                                    state.isEditing ? 'Cancel' : 'Edit Profile',
                                backgroundColor: state.isEditing
                                    ? Colors.black12
                                    : GCCDColor.googleBlue,
                                withIcon: true,
                                icon: state.isEditing
                                    ? Icons.cancel_outlined
                                    : Icons.edit_note_outlined,
                                isOutlined: true,
                                onPressed: () {
                                  context
                                      .read<EditProfileCubit>()
                                      .toggleEditing();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
