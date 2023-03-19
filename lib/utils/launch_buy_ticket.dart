import 'package:ccd2023/configurations/configurations.dart';
import 'package:url_launcher/url_launcher_string.dart';

void launchBuyTicket(String firstName, String lastName, String email,String phone){
  launchUrlString(
    '${baseBuyTicketURI}firstname=$firstName&lastname=$lastName&emailid=$email&cq1=$phone',
  );
}
