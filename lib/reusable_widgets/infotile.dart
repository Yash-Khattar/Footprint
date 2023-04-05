import "package:flutter/material.dart";
import 'package:footprint/const.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subtext;
  final Color color;
  InfoTile(
      {required this.icon,
      required this.title,
      required this.subtext,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Container(
          height: 60,
          width: double.infinity,
          color: kwhiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: kgreenColor,
                child: Icon(
                  icon,
                  color: color,
                  size: 22,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: kgreyColor, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      subtext,
                      style: TextStyle(
                          color: kgreyColor.withOpacity(0.7), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
