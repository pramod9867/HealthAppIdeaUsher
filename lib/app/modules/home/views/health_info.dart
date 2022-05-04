import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:healthapp/app/modules/home/controllers/health_controller.dart';
import 'package:healthapp/service/themeService.dart';
import 'package:healthapp/utils/appImages/appimages.dart';
import 'package:healthapp/utils/sizeConfig/sizeconfig.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HealthInfo extends GetView<HealthController> {
  late final width;
  late final HealthController obj;

  @override
  Widget build(BuildContext context) {
    // width = MediaQuery.of(context).size.width;
    obj = Get.put(HealthController());

    print("Build Called");
    return Scaffold(
      body: Obx(
        () => Container(
          child: obj.brightness.value == Brightness.dark
              ? obj.appState.value == AppState.Loading ||
                      obj.appState.value == AppState.Initial
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : obj.appState.value == AppState.AuthenticationFailed
                      ? Center(
                          child: Container(
                              child: Text(
                          "Authentication Failed !!",
                          style: TextStyle(fontFamily: 'Nunito'),
                        )))
                      : obj.appState.value == AppState.Failed
                          ? Center(
                              child: Container(
                                child: Text(
                                  "Something Went Wrong",
                                  style: TextStyle(fontFamily: 'Nunito'),
                                ),
                              ),
                            )
                          : Container(
                              // height: SizeConfig.screenHeight,
                              decoration:
                                  BoxDecoration(color: Color(0xff323232)),
                              margin: EdgeInsets.symmetric(
                                  vertical: 40, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      ThemeService().switchTheme();
                                    },
                                    child: Text(
                                      "Hi !",
                                      style: TextStyle(
                                          fontSize: 32, fontFamily: 'Nunito'),
                                    ),
                                  ),
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 2,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return index == 0
                                            ? getList(
                                                isDark: true,
                                                percentageIndicator: (obj
                                                                .totalSteps
                                                                .value /
                                                            1500) >
                                                        1
                                                    ? 1
                                                    : (obj.totalSteps.value /
                                                        1500),
                                                headerCount: obj
                                                    .totalSteps.value
                                                    .toStringAsFixed(2))
                                            : index == 1
                                                ? getList(
                                                    isDark: true,
                                                    header: "Calories Burned",
                                                    endingPoint: 1000,
                                                    image: AppImages.kCal,
                                                    startingPoint: 0,
                                                    percentageIndicator:
                                                        (obj.totalCaloriesBurn
                                                                        .value /
                                                                    1000) >
                                                                1
                                                            ? 1
                                                            : (obj.totalCaloriesBurn
                                                                    .value /
                                                                1000),
                                                    headerCount: obj
                                                        .totalCaloriesBurn.value
                                                        .toStringAsFixed(2))
                                                : Container();
                                      }),
                                ],
                              ),
                            )
              : obj.appState.value == AppState.Loading ||
                      obj.appState.value == AppState.Initial
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : obj.appState.value == AppState.AuthenticationFailed
                      ? Center(
                          child: Container(
                              child: Text(
                          "Authentication Failed !!",
                          style: TextStyle(fontFamily: 'Nunito'),
                        )))
                      : obj.appState.value == AppState.Failed
                          ? Center(
                              child: Container(
                                child: Text(
                                  "Something Went Wrong",
                                  style: TextStyle(fontFamily: 'Nunito'),
                                ),
                              ),
                            )
                          : Container(
                              // height: SizeConfig.screenHeight,

                              margin: EdgeInsets.symmetric(
                                  vertical: 40, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      ThemeService().switchTheme();
                                    },
                                    child: Text(
                                      "Hi !",
                                      style: TextStyle(
                                          fontSize: 32, fontFamily: 'Nunito'),
                                    ),
                                  ),
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 2,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return index == 0
                                            ? getList(
                                                isDark: false,
                                                percentageIndicator: (obj
                                                                .totalSteps
                                                                .value /
                                                            1500) >
                                                        1
                                                    ? 1
                                                    : (obj.totalSteps.value /
                                                        1500),
                                                headerCount: obj
                                                    .totalSteps.value
                                                    .toStringAsFixed(2))
                                            : index == 1
                                                ? getList(
                                                    isDark: false,
                                                    header: "Calories Burned",
                                                    endingPoint: 1000,
                                                    image: AppImages.kCal,
                                                    startingPoint: 0,
                                                    percentageIndicator:
                                                        (obj.totalCaloriesBurn
                                                                        .value /
                                                                    1000) >
                                                                1
                                                            ? 1
                                                            : (obj.totalCaloriesBurn
                                                                    .value /
                                                                1000),
                                                    headerCount: obj
                                                        .totalCaloriesBurn.value
                                                        .toStringAsFixed(2))
                                                : Container();
                                      }),
                                ],
                              ),
                            ),
        ),
      ),
    );
  }

  Widget getList(
      {String header = "Steps",
      String headerCount: "12",
      double percentageIndicator: 0.8,
      int startingPoint: 0,
      int endingPoint: 1500,
      String image = AppImages.footSteps,
      bool isDark = false}) {
    print("List Called");
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Text("${header} :",
                              style: TextStyle(
                                fontFamily: 'MontserratRegular',
                              )),
                          Text(
                            "${headerCount}",
                            style: TextStyle(
                              fontFamily: 'NunitoSemi',
                            ),
                          )
                        ],
                      ),
                    ),
                    new LinearPercentIndicator(
                      width: (SizeConfig.screenWidth - 50 - 40 - 20),
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      percent: percentageIndicator,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: isDark ? Colors.white : Colors.black,
                    ),
                    Container(
                      width: (SizeConfig.screenWidth - 50 - 40 - 20),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${startingPoint}",
                            style: TextStyle(
                              fontFamily: 'NunitoSemi',
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Goal :",
                                style: TextStyle(
                                  fontFamily: 'NunitoSemi',
                                ),
                              ),
                              Text(
                                "${endingPoint}",
                                style: TextStyle(
                                  fontFamily: 'NunitoSemi',
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Image.asset(image,
                  height: 50,
                  width: 50,
                  color: isDark ? Colors.white : Colors.black)
            ],
          ),
        ),
      ),
    );
  }
}
