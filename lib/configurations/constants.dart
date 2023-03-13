import 'package:flutter/material.dart';

const kPadding = 8.0;

const appTitle = 'CCD 2023';
const ccdLogo =
    'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-goog/events/CCD-2022_Thumbnail%20Poster.png';

//Base endpoints
const baseURI = 'https://api2.gdgcloud.kolkata.dev/';

const authEndpoint = 'auth/';

const speakerEndpoint = 'speakers/';

const ticketEndpoint = 'tickets/';

const technologiesEndpoint = 'technologies/';

const emailVerificationEndpoint = 'account-confirm-email/';

const talksEndpoint = 'talks/';

const eventsEndpoint = 'events/';

const usersEndpoint = 'users/';

// auth
const registrationEndpoint = '${authEndpoint}registration/';

const loginEndpoint = '${authEndpoint}login/';

const passwordResetEndpoint = '${authEndpoint}password/reset/';

const passwordResetConfirmEndpoint = '${authEndpoint}password/reset/confirm/';

const passwordChangeEndpoint = '${authEndpoint}password/change/';

const logoutEndpoint = '${authEndpoint}logout/';

const authUserEndpoint = '${authEndpoint}user/';

// registration
const emailResendEndpoint = '${registrationEndpoint}resend-email/';

// user
const usersUpdateEndpoint = '${usersEndpoint}profile/';

// local api
const contentEndpoint = 'content';

const drawerItemsMain = [
  'Home',
  'Buy Tickets',
  'Schedule',
  'Speakers',
  'Profile',
  'Team',
];

const drawerItemsMainPath = [
  '/home',
  '/buy_tickets',
  '/schedule',
  '/speakers',
  '/profile',
  '/team',
];

const drawerItemsMainIconOutlined = [
  Icons.home_outlined,
  Icons.local_activity_outlined,
  Icons.calendar_month_outlined,
  Icons.campaign_outlined,
  Icons.person_outlined,
  Icons.group_outlined,
];

const drawerItemsMainIcon = [
  Icons.home,
  Icons.local_activity,
  Icons.calendar_month,
  Icons.campaign,
  Icons.person,
  Icons.group,
];

const drawerItemsFooter = [
  'FAQs',
  'Code of Conduct',
  'Share',
];

//Form control names
const passwordControlName = 'password';
const usernameControlName = 'username';

const String eventTitle = 'Community Days India, 2023';
const String eventHashTag = '#GoogleCloudCommunityDays';
const String eventDescription =
    ' - is series of community-leds events organised by GDG Cloud communities across India to help you prepare for Google Cloud Certifications and learn more about Cloud technologies.';
const String aboutGCCD =
    'GDG Cloud Kolkata is bringing to you the largest Google Cloud developer event in Eastern India. Cloud Community Days Kolkata is the flagship event of GDG Cloud Kolkata, held annually, recollecting the best of the year and setting the stone for the upcoming year. Join us as we bring the best of speakers and help you to put your career on a runway to Google Cloud.';

Duration eventDate = DateTime(2023, 5, 7, 0, 0).difference(DateTime.now());
