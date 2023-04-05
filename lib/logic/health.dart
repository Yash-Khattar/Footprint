import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';

class Health {
  HealthFactory health = HealthFactory();

  void getPermissions() async {
    // if (await Permission.activityRecognition.request().isGranted == false) {
    await Permission.activityRecognition.request();
    // }
  }

  Future<Map> fetchData() async {
    int calories = 40;
    int distance = 3;
    int duration = 45;
    var types = [
      HealthDataType.STEPS,
      // HealthDataType.ACTIVE_ENERGY_BURNED,
    ];

    bool requested = await health.requestAuthorization(types);

    var now = DateTime.now();

    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        now.subtract(Duration(days: 1)), now, types);
    var permissions = [
      HealthDataAccess.READ_WRITE,
      // HealthDataAccess.READ_WRITE,
    ];
    await health.requestAuthorization(types, permissions: permissions);
    bool success =
        await health.writeHealthData(10, HealthDataType.STEPS, now, now);

    var midnight = DateTime(now.year, now.month, now.day);
    int? steps = await health.getTotalStepsInInterval(midnight, now);
    steps ??= 2000;
    // steps = 6450;
    print(steps);
    calories = (steps * 0.045).toInt();
    distance = (steps / 1312.33595801).round();
    duration = (steps ~/ 80);
    return {
      "steps": steps,
      "calories": calories,
      "distance": distance,
      "duration": duration
    };
  }
}
