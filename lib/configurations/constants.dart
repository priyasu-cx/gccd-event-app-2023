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

const drawerItemsFooterPath = [
  '/faq',
  '/faq',
  '/faq',
];

const drawerItemsFooterIconOutlined = [
  Icons.error_outline_outlined,
  Icons.verified_user_outlined,
  Icons.reply_outlined,
];

const drawerItemsFooterIcon = [
  Icons.error_outline,
  Icons.verified_user,
  Icons.reply,
];

//Form control names
const passwordControlName = 'password';
const confirmPasswordControlName = 'confirm-password';
const usernameControlName = 'username';
const emailControlName = 'email';

const String eventTitle = 'Community Days India, 2023';
const String eventHashTag = '#GoogleCloudCommunityDays';
const String eventDescription =
    ' - is series of community-leds events organised by GDG Cloud communities across India to help you prepare for Google Cloud Certifications and learn more about Cloud technologies.';
const String aboutGCCD =
    'GDG Cloud Kolkata is bringing to you the largest Google Cloud developer event in Eastern India. Cloud Community Days Kolkata is the flagship event of GDG Cloud Kolkata, held annually, recollecting the best of the year and setting the stone for the upcoming year. Join us as we bring the best of speakers and help you to put your career on a runway to Google Cloud.';

Duration eventDate = DateTime(2023, 5, 7, 0, 0).difference(DateTime.now());

const String passwordResetResponse = 'Password reset e-mail has been sent.';

// FAQ body
// const FAQBody =
//     "For any queries related to sponsorship, please reach out to us at partners@gdgcloud.kolkata.dev. Any question related to participation can be asked at gdgcloudkol@gmail.com";

const FAQDetails = {
  "title": "Frequently Asked Questions",
  "description":
      "For any queries related to sponsorship, please reach out to us at partners@gdgcloud.kolkata.dev. Any question related to participation can be asked at gdgcloudkol@gmail.com",
  "length": 8,
};

const FAQQuestions = [
  "What is CCD 2023 Kolkata?",
  "What are GDGs?",
  "Who can register for CCD' 2023 Kolkata?",
  "What is Cloud Community Days?",
  "Where can I find updates related to CCD 2023 Kolkata?",
  "How can I attend CCD 2023 Kolkata? How much does it cost?",
  "I want to present a talk/workshop at the conference. What should I do?",
  "Will I be provided travel/stay accommodation to attend the event?",
];

const FAQAnswers = [
  "CCD 2023 Kolkata is short form of Cloud Community Days 2023 Kolkata which is among the largest Cloud developer conferences in Eastern India.",
  "GDGs are focused on community building and learning about Google’s technologies.",
  "People of all levels, from beginners to experts, and anyone with a passion for learning and an interest in technology, including enthusiastic programmers, are welcome to register and attend.",
  "GDG Cloud communities across India organize a series of community-led events called Cloud Community Days to assist you in preparing for Google Cloud Certifications and expanding your knowledge of Cloud technologies.",
  "All announcements related to the event are posted to the GDG Cloud Kolkata chapter mailing list which you can join by Joining the chapter at - GDG Cloud Kolkata Chapter Page. You can receive the updates by following us on Twitter (@gdgcloudkol), Facebook (@gdgcloudkol), Instagram (@gdgcloudkol) or LinkedIn (@gdgcloudkol). You can also join our Telegram group.",
  "CCD 2023 Kolkata is a PAID event. The costs for the ticket to this event are very nominal. You can buy the ticket from \"Buy Ticket\" option on the top. The prices are listed there.",
  "You can submit your talk/workshop proposal on our CFP Page. The deadline for submitting CFP for this year’s conference is 7th April '23, however, the earlier you submit, more the chances of us reviewing your submission in depth.",
  "No. There is no provision for covering attendee travel/stay. For speakers, we will decide on case-by-case basis.",
];

// const FAQPageContent = {
//   "title": "Frequently Asked Questions",
//   "description":
//       "For any queries related to sponsorship, please reach out to us at partners@gdgcloud.kolkata.dev. Any question related to participation can be asked at gdgcloudkol@gmail.com",
//   "length": 8,
//   "faq": [
//     {
//       "question": "What is CCD 2023 Kolkata?",
//       "answer":
//           "CCD 2023 Kolkata is short form of Cloud Community Days 2023 Kolkata which is among the largest Cloud developer conferences in Eastern India."
//     },
//     {
//       "question": "What are GDGs?",
//       "answer":
//           "GDGs are focused on community building and learning about Google’s technologies."
//     },
//     {
//       "question": "Who can register for CCD' 2023 Kolkata?",
//       "answer":
//           "People of all levels, from beginners to experts, and anyone with a passion for learning and an interest in technology, including enthusiastic programmers, are welcome to register and attend."
//     },
//     {
//       "question": "What is Cloud Community Days?",
//       "answer":
//           "GDG Cloud communities across India organize a series of community-led events called Cloud Community Days to assist you in preparing for Google Cloud Certifications and expanding your knowledge of Cloud technologies."
//     },
//     {
//       "question": "Where can I find updates related to CCD 2023 Kolkata?",
//       "answer":
//           "~!~All announcements related to the event are posted to the GDG Cloud Kolkata chapter mailing list which you can join by Joining the chapter at - <a style=\"color:#4285f4\" href=\"https://gdg.community.dev/gdg-cloud-kolkata/\">GDG Cloud Kolkata Chapter Page</a>. You can receive the updates by following us on <a style=\"color:#4285f4\" href=\"https://twitter.com/gdgcloudkol\">Twitter (@gdgcloudkol)</a>, <a style=\"color:#4285f4\" href=\"https://facebook.com/gdgcloudkol\">Facebook (@gdgcloudkol)</a>, <a style=\"color:#4285f4\" href=\"https://instagram.com/gdgcloudkol\">Instagram (@gdgcloudkol)</a> or <a style=\"color:#4285f4\" href=\"https://www.linkedin.com/company/gdgcloudkol/\">LinkedIn (@gdgcloudkol)</a>. You can also join our <a style=\"color:#4285f4\" href=\"https://t.me/gdgcloudkol\">Telegram group</a>."
//     },
//     {
//       "question": "How can I attend CCD 2023 Kolkata? How much does it cost?",
//       "answer":
//           "CCD 2023 Kolkata is a PAID event. The costs for the ticket to this event are very nominal. You can buy the ticket from \"Buy Ticket\" option on the top. The prices are listed there."
//     },
//     {
//       "question":
//           "I want to present a talk/workshop at the conference. What should I do?",
//       "answer":
//           "~!~You can submit your talk/workshop proposal on our <a style=\"color:#4285f4\" href=\"/ccd2023/#/cfs\">CFP Page</a>. The deadline for submitting CFP for this year’s conference is 7th April '23, however, the earlier you submit, more the chances of us reviewing your submission in depth."
//     },
//     {
//       "question":
//           "Will I be provided travel/stay accommodation to attend the event?",
//       "answer":
//           "No. There is no provision for covering attendee travel/stay. For speakers, we will decide on case-by-case basis."
//     }
//   ]
// };

// const FAQItemQuestions = [
//   "What is CCD 2023 Kolkata?",
//   "What are GDGs?",
//   "Who can register for CCD' 2023 Kolkata?",
//   "What is Cloud Community Days?",
//   "Where can I find updates related to CCD 2023 Kolkata?",
//   "How can I attend CCD 2023 Kolkata? How much does it cost?",
//   "I want to present a talk/workshop at the conference. What should I do?",
//   "Will I be provided travel/stay accommodation to attend the event?",
// ];

// const FAQItemAnswers = [
//   "CCD 2023 Kolkata is short form of Cloud Community Days 2023 Kolkata which is among the largest Cloud developer conferences in Eastern India."
// ];
