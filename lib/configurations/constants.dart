import 'package:flutter/material.dart';

const kPadding = 8.0;

const appTitle = 'CCD 2023';
const ccdLogo =
    'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-goog/events/CCD-2022_Thumbnail%20Poster.png';

//Base endpoints
const baseURI = 'https://api2.gdgcloud.kolkata.dev/';

//Ticketing endpoints
const eventCode='google-cloud-community-days-kolkata-2023';
const baseBuyTicketURI = 'https://www.townscript.com/v2/e/$eventCode/booking?';

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
  // 'Schedule',
  // 'Speakers',
  'Profile',
  // 'Team',
];

const drawerItemsMainPath = [
  '/home',
  '/buy-tickets',
  // '/schedule',
  // '/speakers',
  '/profile',
  // '/team',
];

const drawerItemsMainIconOutlined = [
  Icons.home_outlined,
  Icons.local_activity_outlined,
  // Icons.calendar_month_outlined,
  // Icons.campaign_outlined,
  Icons.person_outlined,
  // Icons.group_outlined,
];

const drawerItemsMainIcon = [
  Icons.home,
  Icons.local_activity,
  // Icons.calendar_month,
  // Icons.campaign,
  Icons.person,
  // Icons.group,
];

const drawerItemsFooter = [
  'FAQs',
  'Code of Conduct',
  'Share',
];

const drawerItemsFooterPath = [
  '/faq',
  '/coc',
  '/share',
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
const firstNameControlName = 'first-name';
const lastNameControlName = 'last-name';
const emailControlName = 'email';
const phoneControlName = 'phone';
const collegeControlName = 'college';
const courseControlName = 'course';
const yearControlName = 'year';
const companyControlName = 'company';
const designationControlName = 'designation';
const foodPreferenceControlName = 'food-preference';
const tshirtSizeControlName = 'tshirt-size';
const countryControlName = 'country';

const previousTalkControlName = 'previous_talk';
const travelSupportControlName = 'travel_support';
const topicOfExpertiseControlName = 'topic_of_expertise';
const previouslyTalkedControlName = 'previously_talked';

const talkTitleControlName = 'talk_title';
const talkDescriptionControlName = 'talk_description';
const talkOverviewControlName = 'talk_overview';
const talkEventControlName = 'talk_event';
const talkTypeControlName = 'talk_type';

const String eventTitle = 'Community Days Kolkata, 2023';
const String eventHashTag = '#GoogleCloudCommunityDays';
const String eventDescription =
    ' - is series of community-leds events organised by GDG Cloud communities across India to help you prepare for Google Cloud Certifications and learn more about Cloud technologies.';
const String eventDate_copy = '7th May 2023';
const String eventTime = '9:00 AM - 5:00 PM';
const String eventVenue = 'Biswa Bangla Convention Centre, Kolkata';
const String aboutGCCD =
    'GDG Cloud Kolkata is bringing to you the largest Google Cloud developer event in Eastern India. Cloud Community Days Kolkata is the flagship event of GDG Cloud Kolkata, held annually, recollecting the best of the year and setting the stone for the upcoming year. Join us as we bring the best of speakers and help you to put your career on a runway to Google Cloud.';

Duration eventDate = DateTime(2023, 5, 7, 0, 0).difference(DateTime.now());

const String passwordResetResponse = 'Password reset e-mail has been sent.';

// Profile
List<String> country = [
  "Afghanistan",
  "Albania",
  "Algeria",
  "IN",
];

List<String> tshirtSize = [
  "S",
  "M",
  "L",
  "XL",
  "XXL",
];

// FAQ body
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

// CoC body
const CoCDetails = {
  "title": "Google Developers Event Code of Conduct",
  "description":
      "Google Developers is dedicated to providing a harassment-free and inclusive event experience for everyone regardless of gender identity and expression, sexual orientation, disabilities, neurodiversity, physical appearance, body size, ethnicity, nationality, race, age, religion, or other protected category. We do not tolerate harassment of event participants in any form. Google Developers takes violations of our policy seriously and will respond appropriately.",
  "length": 3,
};

const CoCTitle = [
  "Be excellent to each other",
  "Speak up if you see or hear something",
  "Practice saying \"Yes and\" to each other",
];

const CoCAnswers = [
  "We want the event to be an excellent experience for everyone regardless of gender identity and expression, sexual orientation, disabilities, neurodiversity, physical appearance, body size, ethnicity, nationality, race, age, religion, or other protected category. Treat everyone with respect. Participate while acknowledging that everyone deserves to be here -- and each of us has the right to enjoy our experience without fear of harassment, discrimination, or condescension, whether blatant or via micro-aggressions. Jokes shouldn’t demean others. Consider what you are saying and how it would feel if it were said to or about you.",
  "Harassment is not tolerated, and you are empowered to politely engage when you or others are disrespected. The person making you feel uncomfortable may not be aware of what they are doing, and politely bringing their behavior to their attention is encouraged. If a participant engages in harassing or uncomfortable behavior, the event organizers may take any action they deem appropriate, including warning or expelling the offender from the event with no refund. If you are being harassed or feel uncomfortable, notice that someone else is being harassed, or have any other concerns, please contact a member of the event staff immediately.",
  "It’s a theatre improve technique to build on each other’s ideas. We all benefit when we create together.",
];
