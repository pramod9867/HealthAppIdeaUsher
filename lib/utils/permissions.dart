import 'package:health/health.dart';

class Permissions {
  static final healthTypes = [
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED
  ];

  static final permissions = [
    HealthDataAccess.READ,
    HealthDataAccess.READ,
  ];
}
