import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footprint/const.dart';
import 'package:footprint/screens/welcome_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:footprint/reusable_widgets/infotile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/googleSignIn_provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});
  static String id = 'userProfile_screen';
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: kgreyColor,
                width: double.infinity,
                height: 160,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 26),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/textlogo_white.png",
                        height: 40,
                        width: 115,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.logout,
                          color: kwhiteColor,
                          size: 22,
                        ),
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.logout();
                          Navigator.pushNamed(context, WelcomeScreen.id);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 90,
                left: MediaQuery.of(context).size.width / 3,
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: kwhiteColor,
                  child: CircleAvatar(
                    backgroundColor: kgreenColor,
                    child: Image.asset(
                      "assets/profile_pic.png",
                      fit: BoxFit.contain,
                    ),
                    radius: 65,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 65),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Text(
              "Streak",
              style: TextStyle(
                  color: kgreyColor, fontSize: 26, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 22),
              CircularPercentageIndicator(day: "M", percentage: 0.4),
              CircularPercentageIndicator(day: "T", percentage: 0.7),
              CircularPercentageIndicator(day: "W", percentage: 0.8),
              CircularPercentageIndicator(day: "T", percentage: 0.5),
              CircularPercentageIndicator(day: "F", percentage: 0.9),
              CircularPercentageIndicator(day: "S", percentage: 0.5),
              CircularPercentageIndicator(day: "S", percentage: 0.6),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Text(
              "Leader Board",
              style: TextStyle(
                  color: kgreyColor, fontSize: 26, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 10),
          InfoTile(
              icon: FontAwesomeIcons.one,
              title: "Yash Khattar",
              subtext: "10213 steps",
              color: kgreyColor),
          InfoTile(
            icon: FontAwesomeIcons.two,
            title: "Harsh Pandit",
            subtext: "7213 steps",
            color: kgreyColor,
          ),
          InfoTile(
            icon: FontAwesomeIcons.three,
            title: "Yash Bharduaj",
            subtext: "3213 steps",
            color: kgreyColor,
          ),
          InfoTile(
            icon: FontAwesomeIcons.four,
            title: "Dhairya Arora",
            subtext: "3001 steps",
            color: kgreyColor,
          ),
        ],
      ),
    );
  }
}

class CircularPercentageIndicator extends StatelessWidget {
  final String day;
  final double percentage;
  const CircularPercentageIndicator(
      {required this.day, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.5),
      child: CircularPercentIndicator(
        radius: 22.0,
        animation: true,
        animationDuration: 800,
        lineWidth: 5.0,
        percent: percentage,
        center: Text(
          day,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
        ),
        circularStrokeCap: CircularStrokeCap.butt,
        backgroundColor: kgreyColor,
        progressColor: kgreenColor,
      ),
    );
  }
}
