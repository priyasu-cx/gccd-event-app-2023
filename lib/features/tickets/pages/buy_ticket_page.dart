import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/presentation/navigation/appbar.dart';
import 'package:ccd2023/features/app/presentation/navigation/drawer.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:ccd2023/features/profile/bloc/edit_profile_cubit.dart';
import 'package:ccd2023/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:ccd2023/utils/launch_url.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/launch_buy_ticket.dart';
import '../../home/presentation/default_button_widget.dart';

class BuyTicketPage extends StatefulWidget {
  const BuyTicketPage({Key? key}) : super(key: key);

  @override
  State<BuyTicketPage> createState() => _BuyTicketPageState();
}

class _BuyTicketPageState extends State<BuyTicketPage> {
  bool _checkAgree = false;
  String _referralCode = '';

  Future<void> _onSubmit(FormGroup form) async {
    final user = AuthCubit.instance.state.user;
    print(user);

    if (form.control(firstNameControlName).value as String == "Anonymous" ||
        form.control(lastNameControlName).value as String == "Wildcat") {
      DjangoflowAppSnackbar.showError("Please change your Name");
      return;
    }

    await AuthCubit.instance.updateProfile(
      pronoun: user?.profile.pronoun ?? "",
      firstName: form.control(firstNameControlName).value as String,
      lastName: form.control(lastNameControlName).value as String,
      phone: form.control(phoneControlName).value as String,
      college: user?.profile.college ?? "",
      course: user?.profile.course ?? "",
      graduationYear: user!.profile.graduationYear,
      company: user.profile.company ?? "",
      role: user.profile.role ?? "",
      foodChoice: user.profile.foodChoice,
      tSize: user.profile.tSize,
      country: user.profile.countryCode,
    );
  }

  FormGroup _formBuilder() {
    final user = AuthCubit.instance.state.user;

    return fb.group(
      {
        emailControlName: FormControl<String>(
          disabled: true,
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
                        EdgeInsets.only(top: screenWidth! * 0.08, bottom: 20),
                    child: Text(
                      'Buy Ticket 🎫',
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
                  Text(
                    "Please edit the fields if not accurate or incomplete and update profile from Profile Page",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: GCCDColor.googleGrey,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  EditProfileWrapper(
                    onSuccess: () {
                      DjangoflowAppSnackbar.showInfo(
                        'Profile updated successfully.',
                      );
                      context.read<EditProfileCubit>().toggleEditing();
                    },
                    onSubmit: _onSubmit,
                    formBuilder: _formBuilder,
                    formContent: [
                      // Email
                      const Text(
                        "Email",
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 6),
                      // ReactiveTextField(
                      //   formControlName: emailControlName,
                      //   autofillHints: const [AutofillHints.email],
                      //   validationMessages: {
                      //     ValidationMessage.required: (_) =>
                      //         'Email cannot be empty',
                      //     ValidationMessage.email: (_) => 'Email is not valid',
                      //   },
                      // ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(kPadding * 2),
                          border: Border.all(
                            color: GCCDColor.googleGrey.withOpacity(0.5),
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          user?.email ?? '',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: GCCDColor.googleGrey,
                                  ),
                        ),
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
                      const Text(
                        "Referral Code (Optional)",
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 6),
                      Form(
                        // key: _formKey,
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              // controller: _referralCodeController,
                                  onChanged: (value) {
                                    _referralCode = value!;
                                    print(_referralCode);
                                  },
                              decoration: InputDecoration(
                                hintText: "Enter Referral Code",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: GCCDColor.googleGrey,
                                    ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color:
                                        GCCDColor.googleGrey.withOpacity(0.5),
                                    width: 1,
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                    editButtonText: "Save",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenWidth! * 0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                checkColor: Colors.white,
                                activeColor: GCCDColor.googleBlue,
                                value: _checkAgree,
                                onChanged: (value) {
                                  setState(() {
                                    _checkAgree = value!;
                                  });
                                }),
                            Expanded(
                                child: RichText(
                              text: TextSpan(
                                text: 'I agree to the ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: GCCDColor.googleGrey,
                                    ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Refund Policy and Terms & Conditions',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: GCCDColor.googleBlue,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        launchExternalUrl(RefundPolicy);
                                      },
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenWidth! * 0.4,
                              child: DefaultButton(
                                text: 'Buy Tickets',
                                backgroundColor: _checkAgree
                                    ? GCCDColor.googleGreen
                                    : GCCDColor.googleGrey,
                                withIcon: true,
                                icon: Icons.local_activity_outlined,
                                isOutlined: true,
                                onPressed: () {
                                  if (!_checkAgree) {
                                    DjangoflowAppSnackbar.showError(
                                      'Please agree to the Refund Policy and Terms & Conditions.',
                                    );
                                    return;
                                  }
                                  if (user == null) {
                                    DjangoflowAppSnackbar.showInfo(
                                        'Session Expired. Please login again.');
                                    context.read<AuthCubit>().logout();
                                  } else if (user.profile.phone == null) {
                                    DjangoflowAppSnackbar.showError(
                                      'Please complete profile from Profile Page.',
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
                                    text: state.isEditing
                                        ? 'Cancel'
                                        : 'Edit Profile',
                                    backgroundColor: state.isEditing
                                        ? Colors.black12
                                        : GCCDColor.googleBlue,
                                    withIcon: true,
                                    icon: state.isEditing
                                        ? Icons.cancel_outlined
                                        : Icons.edit_note_outlined,
                                    isOutlined: true,
                                    onPressed: () {
                                      if (user?.profile.phone == null) {
                                        DjangoflowAppSnackbar.showError(
                                          'Please complete profile from Profile Page.',
                                        );
                                        return;
                                      }
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
