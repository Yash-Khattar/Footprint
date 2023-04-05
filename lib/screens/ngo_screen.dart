import 'package:flutter/material.dart';
import 'package:footprint/const.dart';
import 'package:footprint/screens/ngo_profile.dart';

import 'package:provider/provider.dart';

import '../providers/pedometer_provider.dart';

class NGOScreen extends StatefulWidget {
  const NGOScreen({super.key});
  static String id = 'ngo_screen';
  @override
  State<NGOScreen> createState() => _NGOScreenState();
}

class _NGOScreenState extends State<NGOScreen> {
  // Client? httpClient;
  // Web3Client? ethClient;

  // @override
  // void initState() {
  //   httpClient = Client();
  //   ethClient = Web3Client(infura_url, httpClient!);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<PedometerProvider>(
        builder: (context, PedometerModel, child) {
      return Scaffold(
        backgroundColor: kwhiteColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 22, top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/textlogo_grey.png",
                      height: 40,
                      width: 115,
                    ),
                    Icon(
                      Icons.more_vert_rounded,
                      color: kgreyColor,
                      size: 22,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Text(
                "Donations",
                style: TextStyle(
                    color: kgreyColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 22, 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: kwhiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 1,
                        color: Color.fromARGB(255, 243, 240, 240),
                      )
                    ],
                  ),
                  height: 125,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: kgreenColor,
                          size: 90,
                        ),
                        SizedBox(width: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Coins",
                              style: TextStyle(
                                  color: kgreyColor,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${(PedometerModel.pedometerData["steps"] / 100)} FP",
                              style: TextStyle(color: kgreyColor, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Text(
                "Educational NGOs",
                style: TextStyle(
                    color: kgreyColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 350,
                child: ListView(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  children: [
                    NGOCard(),
                    NGOCard(),
                    NGOCard(),
                    NGOCard(),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Text(
                "Social NGOs",
                style: TextStyle(
                    color: kgreyColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 350,
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    NGOCard(),
                    NGOCard(),
                    NGOCard(),
                    NGOCard(),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Text(
                "Environmental NGOs",
                style: TextStyle(
                    color: kgreyColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 350,
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    NGOCard(),
                    NGOCard(),
                    NGOCard(),
                    NGOCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class NGOCard extends StatelessWidget {
  const NGOCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        height: 350,
        width: 250,
        decoration: BoxDecoration(
          color: kgreyColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Container(
                height: 150,
                width: 220,
                decoration: BoxDecoration(
                  color: kwhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Image.asset(
                  "assets/ngo-logo.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              "Smile Foundation",
              style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: LinearProgressIndicator(
                backgroundColor: kwhiteColor,
                color: kgreenColor,
                value: 0.7,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kgreenColor),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ))),
              child: Text("Learn More"),
              onPressed: () {
                Navigator.pushNamed(context, NGOProfile.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
