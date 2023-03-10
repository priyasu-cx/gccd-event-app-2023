// This file contains all the static data for the home screen

abstract class HomeScreenData {
  static const String eventTitle = 'Community Days India, 2023';
  static const String eventHashTag = '#GoogleCloudCommunityDays';
  static const String eventDescription =
      ' - is series of community-leds events organised by GDG Cloud communities across India to help you prepare for Google Cloud Certifications and learn more about Cloud technologies.';
  static const String aboutGCCD =
      'GDG Cloud Kolkata is bringing to you the largest Google Cloud developer event in Eastern India. Cloud Community Days Kolkata is the flagship event of GDG Cloud Kolkata, held annually, recollecting the best of the year and setting the stone for the upcoming year. Join us as we bring the best of speakers and help you to put your career on a runway to Google Cloud.';

  // Event Date - May 6, 2023
  static Duration eventDate = DateTime(2023, 5, 7, 0, 0).difference(DateTime.now());
}