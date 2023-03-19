import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:ccd2023/features/speaker/data/enums/accomodation.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import '../../speaker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';

import '../../../app/data/repository/dio/dio_api_client.dart';
import '../../../app/presentation/pages/form_page.dart';

class CFSPage extends StatelessWidget {
  const CFSPage({Key? key}) : super(key: key);

  FormGroup _formBuilder() => fb.group(
        {
          previousTalkControlName: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          travelSupportControlName: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          topicOfExpertiseControlName: FormControl<List<Technology>>(
            validators: [
              Validators.required,
            ],
          ),
          previouslyTalkedControlName: FormControl<bool>(
            validators: [
              Validators.required,
            ],
            value: false,
          ),
        },
      );

  Future<void> _onSubmit(FormGroup form, BuildContext context) async {
    final previousTalks = form.control(previousTalkControlName).value as String;
    final travelSupportRequired =
        form.control(travelSupportControlName).value as String;
    final topicsOfExpertise =
        (form.control(topicOfExpertiseControlName).value as List<Technology>)
            .map((e) => e.id)
            .toList();
    final previouslyTalked =
        form.control(previouslyTalkedControlName).value as bool;
    SpeakerPayload payload = SpeakerPayload(
      previousTalks: previousTalks,
      travelSupport: travelSupportRequired,
      topicsOfExpertise: topicsOfExpertise,
      previouslyTalked: previouslyTalked,
    );
    await context.read<CFSCubit>().submitSpeakerProfile(
          payload: payload,
          authToken: AuthCubit.instance.state.accessToken!,
        );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TechnologyRepository>(
          create: (context) => TechnologyRepository(
            context.read<DioApiClient>(),
          ),
        ),
        RepositoryProvider<CFSRepository>(
          create: (context) => CFSRepository(
            context.read<DioApiClient>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TechnologyCubit>(
            create: (context) => TechnologyCubit(
              context.read<TechnologyRepository>(),
            )..getTechnologies(),
          ),
          BlocProvider<CFSCubit>(
            create: (context) => CFSCubit(
              context.read<CFSRepository>(),
            ),
          ),
        ],
        child: Builder(builder: (context) {
          return FormWrapper(
            appBarTitle: 'Create your speaker profile',
            submitButtonText: 'Continue',
            formBuilder: _formBuilder,
            onSubmit: (group) async {
              _onSubmit(group, context);
            },
            onSuccess: () {
              context.popRoute();
              DjangoflowAppSnackbar.showInfo(
                'Speaker profile created. You are ready to submit talks now.',
              );
            },
            formContent: [
              const Text(
                "Previous Talk Links",
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: kPadding * 3 / 4,
              ),
              ReactiveTextField(
                formControlName: previousTalkControlName,
                validationMessages: {
                  ValidationMessage.required: (_) =>
                      'Previous talk links cannot be empty',
                },
              ),
              const SizedBox(height: kPadding * 2.5),
              const Text(
                "Travel Support Required",
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: kPadding * 3 / 4),
              ReactiveDropdownField<String>(
                formControlName: travelSupportControlName,
                items: AccomodationEnum.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.value,
                        child: Text(
                          e.name,
                        ),
                      ),
                    )
                    .toList(),
                validationMessages: {
                  ValidationMessage.required: (_) =>
                      'Travel Support Required cannot be empty',
                },
              ),
              const SizedBox(
                height: kPadding * 2.5,
              ),
              const Text(
                "Topics of Expertise",
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: kPadding * 3 / 4),
              BlocBuilder<TechnologyCubit, TechnologyState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const Offstage(),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (items) => ReactiveDropdownSearchMultiSelection<
                        Technology, Technology>(
                      formControlName: topicOfExpertiseControlName,
                      items: items,
                      itemAsString: (item) => item.name,
                      popupProps: const PopupPropsMultiSelection.menu(
                          listViewProps: ListViewProps(
                        physics: BouncingScrollPhysics(),
                      )),
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'Topics of expertise cannot be empty',
                      },
                    ),
                    error: (message) => Center(
                      child: Text(
                        'Error loading technologies',
                        style: textTheme.headlineSmall,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: kPadding * 2.5,
              ),
              ReactiveSwitchListTile.adaptative(
                formControlName: previouslyTalkedControlName,
                title: const Text('Previously Talked At GCCD Kolkata ?'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
