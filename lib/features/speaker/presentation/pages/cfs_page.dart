import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:ccd2023/features/speaker/data/enums/accomodation.dart';
import 'package:ccd2023/features/speaker/data/payloads/talk_payload.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import '../../data/enums/talk.dart';
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

  FormGroup _talkFormBuilder() => fb.group(
        {
          talkTitleControlName: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          talkDescriptionControlName: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          talkOverviewControlName: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          talkEventControlName: FormControl<int>(
            validators: [
              Validators.required,
            ],
          ),
          talkTypeControlName: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          topicOfExpertiseControlName: FormControl<List<Technology>>(
            validators: [
              Validators.required,
            ],
          ),
        },
      );

  Future<void> _onSubmitSpeaker(FormGroup form, BuildContext context) async {
    final previousTalks = form.control(previousTalkControlName).value as String;
    final travelSupportRequired =
        form.control(travelSupportControlName).value as String;
    final topicsOfExpertise =
        (form.control(topicOfExpertiseControlName).value as List<Technology>)
            .map((e) => e.id)
            .toList();
    final previouslyTalked =
        form.control(previouslyTalkedControlName).value as bool;
    final payload = SpeakerPayload(
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

  Future<void> _onSubmitTalk(FormGroup form, BuildContext context) async {
    final title = form.control(talkTitleControlName).value as String;
    final description =
        form.control(talkDescriptionControlName).value as String;
    final overview = form.control(talkOverviewControlName).value as String;
    final event = form.control(talkEventControlName).value as int;
    final technologies =
        (form.control(topicOfExpertiseControlName).value as List<Technology>)
            .map((e) => e.id)
            .toList();
    final format = form.control(talkTypeControlName).value as String;

    final payload = TalkPayload(
      title: title,
      description: description,
      overview: overview,
      format: format,
      technologies: technologies,
      event: event,
      speakers: <int>[
        context.read<CFSCubit>().state.speakerId!,
      ],
    );

    await context.read<CFSCubit>().submitTalk(
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
        RepositoryProvider<EventRepository>(
          create: (context) => EventRepository(
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
          BlocProvider<EventCubit>(
            create: (context) => EventCubit(
              context.read<EventRepository>(),
            )..getEvents(
                authToken: AuthCubit.instance.state.accessToken!,
              ),
          ),
          BlocProvider<CFSCubit>(
            create: (context) => CFSCubit(
              context.read<CFSRepository>(),
            )..checkSpeakerProfileExists(
                authToken: AuthCubit.instance.state.accessToken!,
              ),
          ),
        ],
        child: BlocBuilder<CFSCubit, CFSState>(builder: (context, state) {
          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return FormWrapper(
            appBarTitle: state.isSpeaker
                ? 'Talk for GCCD Kolkata 2023'
                : 'Create your speaker profile',
            submitButtonText: 'Submit',
            formBuilder: state.isSpeaker ? _talkFormBuilder : _formBuilder,
            onSubmit: (group) async {
              if (state.isSpeaker) {
                await _onSubmitTalk(group, context);
              } else {
                await _onSubmitSpeaker(group, context);
              }
            },
            onSuccess: () {
              context.popRoute();
              DjangoflowAppSnackbar.showInfo(
                state.isSpeaker
                    ? 'Talk Submitted'
                    : 'Speaker profile created. You are ready to submit talks now.',
              );
            },
            formContent: state.isSpeaker
                ? [
                    const Text(
                      "Title",
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: kPadding * 3 / 4,
                    ),
                    ReactiveTextField(
                      formControlName: talkTitleControlName,
                      decoration: const InputDecoration(
                        hintText: 'Title of your talk',
                      ),
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'Title cannot be empty',
                      },
                    ),
                    const SizedBox(height: kPadding * 2.5),
                    const Text(
                      "Description",
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: kPadding * 3 / 4),
                    ReactiveTextField(
                      minLines: 3,
                      maxLines: 15,
                      decoration: const InputDecoration(
                        hintText: 'This will be used for internal analysis',
                      ),
                      formControlName: talkDescriptionControlName,
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'Description cannot be empty',
                      },
                    ),
                    const SizedBox(
                      height: kPadding * 2.5,
                    ),
                    const Text(
                      "Overview",
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: kPadding * 3 / 4),
                    ReactiveTextField(
                      minLines: 5,
                      maxLines: 15,
                      decoration: const InputDecoration(
                        hintText:
                            'This will be displayed to the public after talk is selected',
                      ),
                      formControlName: talkOverviewControlName,
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'Overview cannot be empty',
                      },
                    ),
                    const SizedBox(
                      height: kPadding * 2.5,
                    ),
                    const Text(
                      "Event",
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: kPadding * 3 / 4),
                    BlocBuilder<EventCubit, EventState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const Offstage(),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          loaded: (items) => ReactiveDropdownField<int>(
                            formControlName: talkEventControlName,
                            items: items
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(e.title),
                                  ),
                                )
                                .toList(),
                            selectedItemBuilder: (context) => items
                                .map(
                                  (e) => SizedBox(
                                    width: screenWidth! * 0.7,
                                    child: Text(
                                      e.title,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                                .toList(),
                            validationMessages: {
                              ValidationMessage.required: (_) =>
                                  'Event cannot be empty',
                            },
                          ),
                          error: (message) => Center(
                            child: Text(
                              'Error loading events',
                              style: textTheme.headlineSmall,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: kPadding * 2.5,
                    ),
                    const Text(
                      "Type of Talk",
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: kPadding * 3 / 4),
                    ReactiveDropdownField<String>(
                      formControlName: talkTypeControlName,
                      items: Talk.values
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
                            'Event cannot be empty',
                      },
                    ),
                    const SizedBox(
                      height: kPadding * 2.5,
                    ),
                    const Text(
                      "Technologies",
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: kPadding * 3 / 4),
                    BlocBuilder<TechnologyCubit, TechnologyState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const Offstage(),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          loaded: (items) =>
                              ReactiveDropdownSearchMultiSelection<Technology,
                                  Technology>(
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
                    const SizedBox(height: kPadding * 3 / 4),
                  ]
                : [
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
                          loaded: (items) =>
                              ReactiveDropdownSearchMultiSelection<Technology,
                                  Technology>(
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
