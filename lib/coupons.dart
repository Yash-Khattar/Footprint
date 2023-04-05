import 'package:flutter/material.dart';

class Product {
  final String imageUrl;
  final String title;
  final String donations;

  Product(
      {required this.imageUrl, required this.title, required this.donations});
}

List<Product> coupons = [
  Product(
      imageUrl: 'assets/shoes.png',
      title: "50% off on Shoes",
      donations: "1 Donation"),
  Product(
      imageUrl: 'assets/Boat.png',
      title: "20% off on T-shirts",
      donations: "2 Donations"),
  Product(
      imageUrl: 'assets/Boat.png',
      title: "Free Shippings",
      donations: "5 Donations"),
  Product(
      imageUrl: 'assets/shoes.png',
      title: "30% off on Books",
      donations: "10 Donations"),
  Product(
      imageUrl: 'assets/shoes.png',
      title: "10% off on Groceries",
      donations: "20 Donations"),
  Product(
      imageUrl: 'assets/Boat.png',
      title: "15% off on tws",
      donations: "30 Donations"),
];

List<Product> dummyHealthProducts = [
  Product(
      title: 'Blood Pressure Monitor',
      imageUrl: 'assets/BP.png',
      donations: "1 Donation"),
  Product(
      title: 'Smart Watch',
      imageUrl: 'assets/pulse-oximeter.png',
      donations: "2 Donations"),
  Product(
      title: 'Pulse Oximeter',
      imageUrl: 'assets/pulse-oximeter.png',
      donations: "5 Donations"),
  Product(
      title: 'Infrared Thermometer',
      imageUrl: 'assets/BP.png',
      donations: "10 Donations"),
  Product(
      title: 'Electric Toothbrush',
      imageUrl: 'assets/BP.png',
      donations: "20 Donations"),
  Product(
      title: 'Resistance Bands',
      imageUrl: 'assets/pulse-oximeter.png',
      donations: "30 Donations"),
];
