import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:ccd2023/features/home/home.dart';
import 'package:ccd2023/features/profile/bloc/add_social_cubit.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../bloc/edit_profile_cubit.dart';
import 'add_social.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  FormGroup _formBuilder() {
    final user = AuthCubit.instance.state.user;

    return fb.group({
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
      ),
      courseControlName: FormControl<String>(
        value: user?.profile.course ?? '',
      ),
      yearControlName: FormControl<String>(
        validators: [
          Validators.number,
          Validators.minLength(4),
          Validators.maxLength(4),
        ],
        value: user?.profile.graduationYear.toString() ?? '',
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
      socialLinkControlName: FormControl<String>(
        validators: [
          Validators.pattern(
            r'^((http|https)://)?(www.)?([a-zA-Z0-9]+).[a-zA-Z0-9]+.[a-zA-Z0-9]+',
          ),
        ]
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    SvgPicture.asset(
                      GCCDImageAssets.victoriaSVGImage,
                      width: screenWidth!,
                    ),
                    // SizedBox(height: screenWidth! * 0.06),
                    Row(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, ${user?.profile.firstName ?? 'Anonymous'} ${user?.profile.lastName ?? 'Jedi'}',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              '@ ${user?.username ?? 'Grogu'}',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth! * 0.06),
                    Row(
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
                              context.router.push(const BuyTicketRoute());
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
                    SizedBox(height: screenWidth! * 0.03),
                    BlocBuilder<EditProfileCubit, EditState>(
                      builder: (context, state) {
                        if (!state.isEditing) {
                          return Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                padding: EdgeInsets.all(screenWidth! * 0.02),
                                decoration: BoxDecoration(
                                  color: GCCDColor.googleGrey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Add socials by editing your profile.",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )),
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // IconButton(
                              //   icon: const Icon(FontAwesome5.linkedin),
                              //   onPressed: () {
                              //     throw UnimplementedError();
                              //   },
                              // ),
                              InkWell(
                                    onTap: () {
                                    },
                                    child: Container(
                                        padding:
                                        EdgeInsets.all(screenWidth! * 0.02),
                                        decoration: BoxDecoration(
                                          color:
                                          GCCDColor.googleGrey.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Add social",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                            const Icon(
                                              Icons.add,
                                              size: 16,
                                            )
                                          ],
                                        )),
                                  ),

                            ],
                          );
                        }
                      },
                    ),
                BlocBuilder<EditProfileCubit, EditState>(
                  builder: (context, state){


                    return state.isEditing
                      ? Container(
                        margin: EdgeInsets.only(top: screenWidth! * 0.03),
                        padding: EdgeInsets.symmetric(
                            vertical: screenWidth! * 0.02,
                            horizontal: screenWidth! * 0.02),
                        decoration: BoxDecoration(
                          color: GCCDColor.googleGrey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            // SizedBox(
                            //   width: screenWidth! * 0.6,
                            //   child: EditSocialWrapper(
                            //     onSubmit: (form) {
                            //       if (kDebugMode) {
                            //         print(form.value);
                            //       }
                            //       throw UnimplementedError();
                            //     },
                            //     formBuilder: _formBuilder,
                            //     formContent: [
                            //       ReactiveTextField(
                            //         formControlName: socialLinkControlName,
                            //         decoration: InputDecoration(
                            //           labelText: 'Social Name',
                            //           border: OutlineInputBorder(
                            //             borderRadius: BorderRadius.circular(10),
                            //           ),
                            //         ),
                            //       ),
                            //     ], editButtonText: 'ADD',
                            //   )
                            // ),
                            Expanded(child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Social Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),),
                            SizedBox(width: screenWidth! * 0.02),
                            SizedBox(
                              width: screenWidth! * 0.15,
                              height: 62,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(15),
                                  ),
                                  side: const BorderSide(
                                    color: GCCDColor.googleGrey,
                                    width: 1,
                                  ),
                                ),
                                onPressed: () {
                                  throw UnimplementedError();
                                },
                                child: const Icon(
                                  Icons.add_circle_sharp,
                                  color: GCCDColor.googleGrey,
                                ),
                              ),
                            )
                          ],
                        )
                      // : const Offstage(),
                    ): const Offstage();
                  },
                ),


                    SizedBox(height: screenWidth! * 0.06),
                    Column(
                      children: [
                        EditProfileWrapper(
                          headerText: "Personal Details",
                          onSubmit: (form) {
                            if (kDebugMode) {
                              print(form.value);
                            }
                            throw UnimplementedError();
                          },
                          editButtonText: "Save Changes",
                          formBuilder: _formBuilder,
                          formContent: [
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
                              validationMessages: {
                                ValidationMessage.number: (_) =>
                                    'Enter a valid year',
                                ValidationMessage.minLength: (_) =>
                                    'Enter a valid year',
                                ValidationMessage.maxLength: (_) =>
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
                            const Text(
                              "T-Shirt Size",
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 6),
                            ReactiveDropdownField(
                                items: getTshirtSizeDropdownItems(),
                                formControlName: tshirtSizeControlName),
                            const SizedBox(height: 20),

                            /// Country
                            const Text(
                              "Country",
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 6),
                            ReactiveDropdownField(
                                items: getCountryDropdownItems(),
                                formControlName: countryControlName),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
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
