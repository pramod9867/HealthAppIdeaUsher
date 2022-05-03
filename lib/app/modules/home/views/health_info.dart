import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:healthapp/app/modules/home/controllers/health_controller.dart';
import 'package:healthapp/service/themeService.dart';
import 'package:healthapp/utils/appImages/appimages.dart';
import 'package:healthapp/utils/sizeConfig/sizeconfig.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HealthInfo extends GetView<HealthController> {
  late final width;

  @override
  Widget build(BuildContext context) {
    // width = MediaQuery.of(context).size.width;
    final obj = Get.put(HealthController());
    return Scaffold(
      body: Obx(
        () => Container(
          child: obj.appState.value == AppState.Loading ||
                  obj.appState.value == AppState.Initial
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : obj.appState.value == AppState.AuthenticationFailed
                  ? Center(
                      child: Container(child: Text("Authentication Failed !!")))
                  : obj.appState.value == AppState.Failed
                      ? Center(
                          child: Container(child: Text("Something Went Wrong")))
                      : Container(
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
                                  itemCount: obj.healthDataList.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return index == 0
                                        ? getList(
                                            percentageIndicator:
                                                (obj.healthDataList[index]
                                                                .value /
                                                            1500) >
                                                        1
                                                    ? 1
                                                    : (obj.healthDataList[index]
                                                            .value /
                                                        1500),
                                            headerCount: obj
                                                .healthDataList[index].value
                                                .toString())
                                        : index == 1
                                            ? getList(
                                                header: "Calories Burned",
                                                endingPoint: 1000,
                                                image: AppImages.kCal,
                                                startingPoint: 0,
                                                percentageIndicator: (obj
                                                                .healthDataList[
                                                                    index]
                                                                .value /
                                                            1000) >
                                                        1
                                                    ? 1
                                                    : (obj.healthDataList[index]
                                                            .value /
                                                        1000),
                                                headerCount: obj
                                                    .healthDataList[index].value
                                                    .toString())
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
      String image = AppImages.footSteps}) {
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
                      progressColor: ThemeService().theme == ThemeMode.dark
                          ? Colors.white
                          : Colors.black,
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
              Image.asset(
                image,
                height: 50,
                width: 50,
                color: ThemeService().theme == ThemeMode.dark
                    ? Colors.white
                    : Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
