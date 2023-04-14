import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:ccd2023/features/home/home.dart';
import 'package:ccd2023/features/profile/bloc/edit_profile_cubit.dart';
import 'package:ccd2023/features/profile/presentation/pages/profile_header_buttons.dart';
import 'package:ccd2023/features/profile/presentation/pages/social_icons.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'add_social.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Future<void> fetchProfile() async {
    await AuthCubit.instance.fetchProfile();
  }

  Future<void> _onSocialSubmit(
    FormGroup form,
  ) async {
    final socialControl = form.control(socialLinkControlName);
    final url = socialControl.value as String;
    AuthCubit.instance.updateSocialLink(url);
    socialControl.value = '';
  }

  Future<void> _onSubmit(FormGroup form) async {
    await AuthCubit.instance.updateProfile(
      pronoun: form.control(pronounControlName).value as String,
      firstName: form.control(firstNameControlName).value as String,
      lastName: form.control(lastNameControlName).value as String,
      phone: form.control(phoneControlName).value as String,
      college: form.control(collegeControlName).value as String,
      course: form.control(courseControlName).value as String,
      graduationYear: form.control(yearControlName).value as int,
      company: form.control(companyControlName).value as String,
      role: form.control(designationControlName).value as String,
      foodChoice: form.control(foodPreferenceControlName).value as String,
      tSize: form.control(tshirtSizeControlName).value as String,
      country: form.control(countryControlName).value as String,
    );
  }

  FormGroup _formBuilder() {
    final user = AuthCubit.instance.state.user;

    return fb.group({
      pronounControlName: FormControl<String>(
        value: user?.profile.pronoun ?? 'Select',
      ),
      firstNameControlName: FormControl<String>(
        value: user?.profile.firstName ?? '',
        validators: [
          Validators.required,
        ],
      ),
      lastNameControlName: FormControl<String>(
        value: user?.profile.lastName ?? '',
        validators: [
          Validators.required,
        ],
      ),
      phoneControlName: FormControl<String>(
        validators: [
          Validators.number,
          Validators.minLength(10),
          Validators.maxLength(10),
        ],
        value: user?.profile.phone ?? '',
      ),
      collegeControlName: FormControl<String>(
        value: user?.profile.college ?? '',
        validators: [
          Validators.required,
        ],
      ),
      courseControlName: FormControl<String>(
        value: user?.profile.course ?? '',
        validators: [
          Validators.required,
        ],
      ),
      yearControlName: FormControl<int>(
        validators: [
          Validators.number,
        ],
        value: user?.profile.graduationYear,
      ),
      companyControlName: FormControl<String>(
        value: user?.profile.company ?? '',
      ),
      designationControlName: FormControl<String>(
        value: user?.profile.role ?? '',
      ),
      foodPreferenceControlName: FormControl<String>(
        value: user?.profile.foodChoice ?? '',
      ),
      tshirtSizeControlName: FormControl<String>(
        value: user?.profile.tSize ?? '',
      ),
      countryControlName: FormControl<String>(
        value: user?.profile.countryCode ?? '',
      ),
    });
  }

  FormGroup _socialFormBuilder() {
    return fb.group({
      socialLinkControlName: FormControl<String>(validators: [
        Validators.required,
        Validators.pattern(
          r'((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?',
        )
      ]),
    });
  }

  @override
  Widget build(BuildContext context) {

    // fetchProfile();
    final user = context.watch<AuthCubit>().state.user;

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
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          GCCDImageAssets.victoriaSVGImage,
                          width: screenWidth!,
                        ),
                        // Positioned(
                        //   // bottom: 0,
                        //   right: 0,
                        //   child: SizedBox(
                        //     width: screenWidth! * 0.4,
                        //     child: BlocBuilder<CFSCubit, CFSState>(
                        //       builder: (context, state) {
                        //         return DefaultButton(
                        //           isOutlined: true,
                        //           backgroundColor: Colors.transparent,
                        //           text: "Speaker Profile",
                        //           onPressed: () {
                        //             state.talks.isEmpty
                        //                 ? context.router.push(
                        //                     CFSRouterRoute(
                        //                       children: [
                        //                         CFSRoute(),
                        //                       ],
                        //                     ),
                        //                   )
                        //                 : context.router.push(
                        //                     const CFSRouterRoute(
                        //                       children: [
                        //                         TalkListRoute(),
                        //                       ],
                        //                     ),
                        //                   );
                        //           },
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    // SizedBox(height: screenWidth! * 0.06),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: GCCDColor.googleYellow,
                                width: 3,
                              )),
                          width: screenWidth! * 0.2,
                          child: CircleAvatar(
                            radius: screenWidth! * 0.1,
                            child: Image.asset(GCCDImageAssets.yoda),
                          ),
                        ),
                        SizedBox(width: screenWidth! * 0.05),
                        Expanded(
                          child: BlocBuilder<EditProfileCubit, EditState>(
                              builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, ${user?.profile.firstName ?? 'Anonymous'} ${user?.profile.lastName ?? 'Jedi'}',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  '@${user?.username ?? 'Grogu'}',
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: screenWidth! * 0.02),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth! * 0.04,
                                        vertical: screenWidth! * 0.01),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: GCCDColor.googleYellow,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Text(
                                        "Total Referral: ${user?.profile.referral ?? 0}"),
                                  ),
                                )
                              ],
                            );
                          }),
                        )
                      ],
                    ),
                    // SizedBox(height: screenWidth! * 0.06),
                    const Divider(),

                    const HeaderButtons(),
                    // SizedBox(height: screenWidth! * 0.03),
                    const SocialIcons(),
                    // SizedBox(height: screenWidth! * 0.03),
                    user?.profile.socials.isEmpty ?? true
                        ? BlocBuilder<EditProfileCubit, EditState>(
                            builder: (context, state) {
                              if (!state.isEditing) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: screenWidth! * 0.03),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        padding:
                                            EdgeInsets.all(screenWidth! * 0.02),
                                        decoration: BoxDecoration(
                                          color: GCCDColor.googleGrey
                                              .withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "Add socials by editing your profile.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        )),
                                  ),
                                );
                              } else {
                                return const Offstage();
                              }
                            },
                          )
                        : const Offstage(),
                    BlocBuilder<EditProfileCubit, EditState>(
                      builder: (context, state) {
                        return state.isEditing
                            ? Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: kPadding,
                                ),
                                padding: const EdgeInsets.all(kPadding),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: GCCDColor.googleGrey,
                                    width: 1,
                                  ),
                                  color: GCCDColor.googleGrey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: EditSocialWrapper(
                                  onSubmit: (form) async {
                                    await _onSocialSubmit(form);
                                  },
                                  formBuilder: _socialFormBuilder,
                                  formContent: [
                                    SizedBox(
                                      width: screenWidth! * 0.56,
                                      child: ReactiveTextField(
                                        decoration: const InputDecoration(
                                          hintText: "Social Link",
                                        ),
                                        formControlName: socialLinkControlName,
                                        validationMessages: {
                                          ValidationMessage.required: (_) =>
                                              'Cannot be empty',
                                          ValidationMessage.pattern: (_) =>
                                              'Enter a valid link',
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const Offstage();
                      },
                    ),
                    const SizedBox(height: kPadding),
                    Builder(builder: (context) {
                      return EditProfileWrapper(
                        headerText: "Profile Details",
                        onSubmit: (form) async {
                          await _onSubmit(form);
                        },
                        onSuccess: () {
                          DjangoflowAppSnackbar.showInfo(
                            'Profile updated successfully.',
                          );
                          context.read<EditProfileCubit>().toggleEditing();
                        },
                        editButtonText: "Save Changes",
                        formBuilder: _formBuilder,
                        formContent: [
                          const Text(
                            "Pronoun",
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 6),
                          ReactiveDropdownField(
                            items: const [
                              DropdownMenuItem(
                                value: "NA",
                                child: Text("Prefer not to Say"),
                              ),
                              DropdownMenuItem(
                                value: "he",
                                child: Text("He/Him"),
                              ),
                              DropdownMenuItem(
                                value: "she",
                                child: Text("She/Her"),
                              ),
                              DropdownMenuItem(
                                value: "they",
                                child: Text("They/Them"),
                              ),
                              DropdownMenuItem(
                                value: "other",
                                child: Text("Other"),
                              ),
                            ],
                            formControlName: pronounControlName,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "First Name",
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 6),
                          ReactiveTextField(
                            formControlName: firstNameControlName,
                            validationMessages: {
                              ValidationMessage.required: (_) =>
                                  'First name cannot be empty',
                            },
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Last Name",
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 6),
                          ReactiveTextField(
                            formControlName: lastNameControlName,
                            validationMessages: {
                              ValidationMessage.required: (_) =>
                                  'Last name cannot be empty',
                            },
                          ),
                          const SizedBox(height: 20),

                          /// Phone Number
                          const Text(
                            "Phone Number",
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 6),
                          ReactiveTextField(
                            formControlName: phoneControlName,
                            autofillHints: const [
                              AutofillHints.telephoneNumber
                            ],
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

                          /// College
                          const Text(
                            "College",
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 6),
                          ReactiveTextField(
                            autofillHints: const [
                              AutofillHints.organizationName
                            ],
                            validationMessages: {
                              ValidationMessage.required: (_) =>
                                  'Organization name is required',
                            },
                            formControlName: collegeControlName,
                          ),
                          const SizedBox(height: 20),

                          /// Course
                          const Text(
                            "Course",
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 6),
                          ReactiveTextField(
                            formControlName: courseControlName,
                            validationMessages: {
                              ValidationMessage.required: (_) =>
                                  'Course is required',
                            },
                          ),
                          const SizedBox(height: 20),

                          /// Year
                          const Text(
                            "Graduation Year",
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 6),
                          ReactiveTextField(
                            formControlName: yearControlName,
                            keyboardType: TextInputType.number,
                            validationMessages: {
                              ValidationMessage.number: (_) =>
                                  'Enter a valid year',
                            },
                          ),
                          const SizedBox(height: 20),

                          /// Company
                          const Text(
                            "Company",
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 6),
                          ReactiveTextField(
                            formControlName: companyControlName,
                          ),
                          const SizedBox(height: 20),

                          /// Designation
                          const Text(
                            "Designation",
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 6),
                          ReactiveTextField(
                            formControlName: designationControlName,
                          ),
                          const SizedBox(height: 20),

                          /// Food Preference
                          const Text(
                            "Food Preference",
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 6),
                          ReactiveDropdownField(items: const [
                            DropdownMenuItem(
                              value: "VEG",
                              child: Text("VEG"),
                            ),
                            DropdownMenuItem(
                              value: "NON-VEG",
                              child: Text("NON-VEG"),
                            ),
                          ], formControlName: foodPreferenceControlName),
                          const SizedBox(height: 20),

                          /// T-Shirt Size
                          Row(
                            children: [
                              const Text(
                                "T-Shirt Size",
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("T-Shirt Size"),
                                        content: const Text(
                                          "Please select the size of your T-Shirt. This will be used to order your T-Shirt for the event.",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("OK"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.info_outline,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 6),
                          ReactiveDropdownField(
                              items: getTshirtSizeDropdownItems(),
                              formControlName: tshirtSizeControlName),
                          // DisabledField(
                          //   text: user?.profile.tSize,
                          // ),
                          // const SizedBox(height: 20),
                          //
                          // /// Country
                          // const Text(
                          //   "Country",
                          //   textAlign: TextAlign.start,
                          // ),
                          // const SizedBox(height: 6),
                          // // ReactiveDropdownField(
                          // //     items: getCountryDropdownItems(),
                          // //     formControlName: countryControlName),
                          // DisabledField(
                          //   text: user?.profile.countryCode,
                          // ),
                          const SizedBox(height: 20),
                        ],
                      );
                    }),
                    // SizedBox(height: screenWidth! * 0.06),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth! * 0.04),
                      child: SizedBox(
                        width: screenWidth! * 0.4,
                        child: DefaultButton(
                            isOutlined: true,
                            withIcon: true,
                            icon: Icons.logout,
                            backgroundColor: GCCDColor.googleRed,
                            text: "Logout",
                            onPressed: () {
                              AuthCubit.instance.logout();
                              context.router.pushAndPopUntil(
                                  const HomeRoute(),
                                  predicate: (route) => false);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

List<DropdownMenuItem<String>> getTshirtSizeDropdownItems() {
  return tshirtSize
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ))
      .toList();
}

List<DropdownMenuItem<String>> getCountryDropdownItems() {
  return country
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ))
      .toList();
}
