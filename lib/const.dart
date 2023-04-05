import 'package:flutter/material.dart';

const Color kgreyColor = Color(0xFF334050);
const Color klightgreyColor = Color.fromARGB(255, 111, 125, 141);
const Color kgreenColor = Color(0xFF00DDA2);
const Color kwhiteColor = Colors.white;
const Color kmutedwhiteColor = Color.fromARGB(158, 255, 255, 255);
const Color ktransparent = Color(0x00000000);

const OutlineInputBorder? kOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(100)),
  borderSide:
      BorderSide(color: kgreyColor, width: 1.5, style: BorderStyle.solid),
);
