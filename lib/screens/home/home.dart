import 'package:auto_route/auto_route.dart';
import 'package:ccd2023/router/ccd_router.gr.dart';
import 'package:ccd2023/utils/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Cloud Community Days 2022",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "A community organized cloud conference with industry experts presenting on exciting topics!",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Organized by",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Image.network("https://gdgcloud.kolkata.dev/ccd2022/logo.png", width: 300,),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Dates: 27th-28th August",
                  style: TextStyle(
                      fontFamily: "GoogleSans",
                      fontSize: 20,
                      color: Color(0xff666666)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    context.router.push(const LoginRoute());
                  },
                  child: SizedBox(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Login",
                        style: const TextStyle(
                          fontFamily: "GoogleSans",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff16a34a),
                  ),
                  onPressed: () {

                  },
                  child: SizedBox(
                    height: 60,
                    child: Center(
                      child: Text(
                         "Become a Speaker".toUpperCase(),
                        style: const TextStyle(
                          fontFamily: "GoogleSans",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "About CCD",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "GDG Cloud Kolkata is bringing to you the largest Google Cloud developer event in Eastern India. Cloud Community Days Kolkata is the flagship event of GDG Cloud Kolkata, held annually, recollecting the best of the year and setting the stone for the upcoming year. Join us as we bring the best of speakers and help you to put your career on a runway to Google Cloud.",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // const FAQ(),

              /// TODO: Add FAQ


              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Code of Conduct",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Google is dedicated to providing a harassment-free and inclusive event experience for everyone regardless of gender identity and expression, sexual orientation, disabilities, neurodiversity, physical appearance, body size, ethnicity, nationality, race, age, religion, or other protected category. We do not tolerate harassment of event participants in any form. Google takes violations of our policy seriously and will respond appropriately.",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 18,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(22.0),
                child: Text(
                  "Be excellent to each other",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 111, 112, 112),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  " We want the event to be an excellent experience for everyone regardless of gender identity and expression, sexual orientation, disabilities, neurodiversity, physical appearance, body size, ethnicity, nationality, race, age, religion, or other protected category. Treat everyone with respect. Participate while acknowledging that everyone deserves to be here -- and each of us has the right to enjoy our experience without fear of harassment, discrimination, or condescension, whether blatant or via micro-aggressions. Jokes shouldn’t demean others. Consider what you are saying and how it would feel if it were said to or about you.",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.all(22.0),
                child: Text(
                  "Speak up if you see or hear something.",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 111, 112, 112),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Harassment is not tolerated, and you are empowered to politely engage when you or others are disrespected. The person making you feel uncomfortable may not be aware of what they are doing, and politely bringing their behavior to their attention is encouraged. If a participant engages in harassing or uncomfortable behavior, the event organizers may take any action they deem appropriate, including warning or expelling the offender from the event with no refund. If you are being harassed or feel uncomfortable, notice that someone else is being harassed, or have any other concerns, please contact a member of the event staff immediately.",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.all(22.0),
                child: Text(
                  "Practice saying 'Yes and' to each other.",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 111, 112, 112),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  " It’s a theatre improv technique to build on each other’s ideas. We all benefit when we create together.",
                  style: TextStyle(
                    fontFamily: "GoogleSans",
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      )
    );
  }
}
