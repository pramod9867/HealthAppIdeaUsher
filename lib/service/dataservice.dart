import 'package:health/health.dart';
import 'package:healthapp/utils/permissions.dart';

class DataService {
  static final currentData = DateTime.now();
  static final yesterday = DateTime.now().subtract(Duration(days: 1));

  static Future<List<HealthDataPoint>> getHealthDataPoints() async {
    HealthFactory health = HealthFactory();
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        yesterday, currentData, Permissions.healthTypes);

    print("List");
    print(healthData);

    return healthData;
  }
}
