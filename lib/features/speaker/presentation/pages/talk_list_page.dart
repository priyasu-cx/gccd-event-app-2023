import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/presentation/gccd_border.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:ccd2023/features/speaker/bloc/cfs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TalkListPage extends StatelessWidget {
  const TalkListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final format = DateFormat('dd/MM/yyyy');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submitted Talks'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(CFSRoute());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<CFSCubit, CFSState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.loading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.talks.length,
                    itemBuilder: (context, index) {
                      final talk = state.talks[index];

                      return Padding(
                        padding: const EdgeInsets.all(kPadding * 2),
                        child: GCCDBorder(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: kPadding * 2,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  talk.title,
                                  style: textTheme.bodyLarge,
                                ),
                                const SizedBox(
                                  height: kPadding,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.date_range),
                                    const SizedBox(
                                      width: kPadding,
                                    ),
                                    Text(
                                      format.format(
                                        DateTime.parse(talk.addedAt ?? ''),
                                      ),
                                      style: textTheme.titleLarge,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: kPadding,
                                ),
                                Text(
                                  'Description',
                                  style: textTheme.titleMedium?.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Text(
                                  talk.description,
                                  style: textTheme.bodyLarge,
                                ),
                                const SizedBox(
                                  height: kPadding,
                                ),
                                Text(
                                  'Overview',
                                  style: textTheme.titleMedium?.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Text(
                                  talk.overview,
                                  style: textTheme.bodyLarge,
                                ),
                                const SizedBox(
                                  height: kPadding,
                                ),
                                Text(
                                  'Status',
                                  style: textTheme.titleMedium?.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Text(
                                  talk.status ?? '',
                                  style: textTheme.bodyLarge,
                                ),
                                const SizedBox(
                                  height: kPadding * 2,
                                ),
                                Row(
                                  children: [
                                    _TalkActionButtons(
                                      color: GCCDColor.googleBlue,
                                      iconData: Icons.edit,
                                      onPressed: () {
                                        context.router.push(
                                          CFSRoute(
                                            talkDescription: talk.description,
                                            talkType: talk.format,
                                            talkId: talk.id,
                                            talkEvent: talk.event,
                                            talkOverview: talk.overview,
                                            talkTitle: talk.title,
                                            topicsOfExpertise:
                                                talk.technologies,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: kPadding,
                                    ),
                                    _TalkActionButtons(
                                      color: GCCDColor.googleRed,
                                      iconData: Icons.delete,
                                      onPressed: () {
                                        context.read<CFSCubit>().deleteTalk(
                                              authToken: AuthCubit
                                                  .instance.state.accessToken!,
                                              id: talk.id!,
                                            );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: kPadding * 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _TalkActionButtons extends StatelessWidget {
  const _TalkActionButtons({
    Key? key,
    required this.color,
    required this.iconData,
    this.onPressed,
  }) : super(key: key);

  final Color color;
  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: color,
        shape: const CircleBorder(),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
