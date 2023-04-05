import 'package:flutter/material.dart';
import 'package:footprint/logic/health.dart';

class PedometerProvider extends ChangeNotifier {
  Map pedometerData = {"steps": 0, "calories": 0, "distance": 0, "duration": 0};
  final _health = Health();
  void getPermission() {
    _health.getPermissions();
  }

  Future<void> getData() async {
    pedometerData = await _health.fetchData();
    notifyListeners();
  }
}
