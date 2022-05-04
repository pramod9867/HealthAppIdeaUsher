import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:healthapp/service/dataservice.dart';
import 'package:healthapp/utils/permissions.dart';

enum AppState { Loading, Failed, Success, AuthenticationFailed, Initial }

class HealthController extends GetxController {
  Rx<AppState> appState = AppState.Initial.obs;
  RxList<HealthDataPoint> healthDataList = RxList([]);
  RxDouble totalSteps = RxDouble(0);
  RxDouble totalCaloriesBurn =RxDouble(0);

  @override
  void onInit() {
    super.onInit();
    print("Intialize Controller Called");
    fetchData();
  }

  @override
  void onReady() {
    // super.onReady();
  }

  @override
  void onClose() {}

  Future<void> fetchData() async {
    appState(AppState.Loading);
    HealthFactory health = HealthFactory();

    bool requested = await health.requestAuthorization(Permissions.healthTypes,
        permissions: Permissions.permissions);
    print("Request Given");
    print(requested);
    if (requested) {
      try {
        print("Request Given");
        // fetch health data
        List<HealthDataPoint> healthData =
            await DataService.getHealthDataPoints();

          // print("Health Data is.....");
          // print(healthData);

        if (healthData.length>=0) {

          for(int i=0;i<healthData.length;i++){
            if(healthData[i].type==HealthDataType.STEPS){
              totalSteps.value+=healthData[i].value.abs();
            }else{
              totalCaloriesBurn.value+=healthData[i].value.abs();
            }
          }
          appState(AppState.Success);

          // healthDataList(healthData);
        }else{
          appState(AppState.Success);
        }
      } catch (error) {
        appState(AppState.Failed);
      }
    } else {
      appState(AppState.AuthenticationFailed);
      // setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }
}
