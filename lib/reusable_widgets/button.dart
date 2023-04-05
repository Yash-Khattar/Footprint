import 'package:flutter/material.dart';
import 'package:footprint/const.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onpressed;
  final String text;
  final Color color;
  PrimaryButton(
      {required this.text, required this.onpressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ))),
      child: Text(text),
      onPressed: onpressed,
    );
  }
}

class GoogleButton extends StatelessWidget {
  final VoidCallback? onpressed;
  final String text;
  final IconData icon;
  GoogleButton(
      {required this.icon, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kgreyColor),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/google.png",
            height: 27,
            width: 27,
          ),
          SizedBox(width: 20),
          Text(text),
        ],
      ),
      onPressed: onpressed,
    );
  }
}
