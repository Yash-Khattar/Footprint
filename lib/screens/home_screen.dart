import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import '../providers/pedometer_provider.dart';
import 'package:footprint/const.dart';
import 'package:footprint/reusable_widgets/infotile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PedometerProvider>(
      builder: (context, PedometerModel, child) {
        int steps = PedometerModel.pedometerData["steps"];
        int calories = PedometerModel.pedometerData["calories"];
        int distance = PedometerModel.pedometerData["distance"];
        int duration = PedometerModel.pedometerData["duration"];
        int goal = 8000;
        double percentage = steps / goal;
        if (percentage > 1) {
          percentage = 1;
        }
        return SafeArea(
          child: Scaffold(
            backgroundColor: kwhiteColor,
            body: Container(
              color: kgreyColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/textlogo_white.png",
                              height: 40,
                              width: 115,
                            ),
                            Icon(
                              Icons.more_vert_rounded,
                              color: kwhiteColor,
                              size: 22,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Hi, Yash!",
                          style: TextStyle(
                              color: kwhiteColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Here's Your Steps.",
                          style: TextStyle(
                              color: kwhiteColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Steps",
                                  style: TextStyle(
                                      color: kwhiteColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  steps.toString(),
                                  style: TextStyle(
                                      color: kwhiteColor,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900),
                                ),
                                const SizedBox(height: 8),
                                LinearPercentIndicator(
                                  animation: true,
                                  animationDuration: 800,
                                  width: 150.0,
                                  lineHeight: 12.0,
                                  percent: percentage,
                                  // ignore: deprecated_member_use
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: kwhiteColor,
                                  progressColor: kgreenColor,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Goal",
                                  style: TextStyle(
                                      color: kwhiteColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  goal.toString(),
                                  style: TextStyle(
                                      color: kwhiteColor,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900),
                                ),
                                const SizedBox(height: 8),
                                LinearPercentIndicator(
                                  animation: true,
                                  animationDuration: 1000,
                                  width: 150.0,
                                  lineHeight: 12.0,
                                  percent: percentage,
                                  // ignore: deprecated_member_use
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: kwhiteColor,
                                  progressColor: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhiteColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              "Activities",
                              style: TextStyle(
                                  color: kgreyColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                ActivityCard(
                                    icon: Icons.food_bank,
                                    value: calories.toString() + " Cal"),
                                ActivityCard(
                                    icon: Icons.timeline,
                                    value: distance.toString() + " Km"),
                                ActivityCard(
                                    icon: Icons.timelapse_sharp,
                                    value: duration.toString() + " min")
                              ],
                            ),
                            const SizedBox(height: 22),
                            InfoTile(
                              icon: FontAwesomeIcons.handHoldingDollar,
                              title: "Donations",
                              subtext: "Check out donations",
                              color: kgreyColor,
                            ),
                            InfoTile(
                              icon: FontAwesomeIcons.heartPulse,
                              title: "Health Status",
                              subtext: "Check out health status",
                              color: kgreyColor,
                            ),
                            InfoTile(
                              icon: Icons.monetization_on,
                              title: "Coin Balance",
                              subtext: "Check out coin balance",
                              color: kgreyColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ActivityCard extends StatelessWidget {
  final IconData icon;
  final String value;
  ActivityCard({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 16, 10, 8),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                color: Color.fromARGB(255, 243, 240, 240),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: kgreyColor,
                  size: 36,
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: value,
                    style: TextStyle(color: kgreyColor, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
