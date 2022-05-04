import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';
import 'package:healthapp/app/modules/home/views/health_info.dart';
import 'package:healthapp/service/themeService.dart';
import 'package:healthapp/utils/appImages/appimages.dart';
import 'package:healthapp/utils/sizeConfig/sizeconfig.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnimatedSplashScreen(
      backgroundColor: SchedulerBinding.instance!.window.platformBrightness ==
              Brightness.dark
          ? Colors.black
          : Colors.white,
      splash: SchedulerBinding.instance!.window.platformBrightness ==
              Brightness.dark
          ? AppImages.boozinDark
          : AppImages.boozin,
      nextScreen: HealthInfo(),
      splashTransition: SplashTransition.slideTransition,
      // pageTransitionType: PageTransitionType.scale!,
    );
  }
}
