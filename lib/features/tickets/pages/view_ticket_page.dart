import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccd2023/configurations/configurations.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/size_util.dart';
import '../../app/presentation/navigation/appbar.dart';
import '../data/model/ticket_model.dart';

class ViewTicketPage extends StatelessWidget {
  const ViewTicketPage({Key? key, required this.ticket}) : super(key: key);

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppCubit>().state.themeMode;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight! * 0.07),
        child: const CCDAppBar(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your Ticket',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1
                        ..color = themeMode == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      // fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: kPadding * 4,
              ),
              CachedNetworkImage(
                imageUrl: '$ticketStorageBaseURI${ticket.tsBookingId}.png',
                width: screenWidth! * 0.6,
              ),
              const SizedBox(
                height: kPadding * 4,
              ),
              Text(
                'Please contact',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              GestureDetector(
                onTap: () => launchUrlString('mailto:gdgcloudkol@gmail.com'),
                child: Text(
                  'gdgcloudkol@gmail.com',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: GCCDColor.googleBlue,
                      ),
                ),
              ),
              Text(
                'for further queries',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: kPadding * 2,
              ),
              _TicketDetails(
                heading: 'Type',
                content: ticket.tsTicketName,
              ),
              _TicketDetails(
                heading: 'Email id',
                content: ticket.tsUserEmailID,
              ),
              _TicketDetails(
                heading: 'Amount paid',
                content: ticket.amount,
              ),
              _TicketDetails(
                heading: 'Booking Id',
                content: ticket.tsBookingId.toString(),
              ),
              const SizedBox(
                height: kPadding * 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TicketDetails extends StatelessWidget {
  const _TicketDetails({Key? key, required this.heading, required this.content})
      : super(key: key);

  final String heading;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth! * 0.1,
        vertical: kPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$heading: ',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
