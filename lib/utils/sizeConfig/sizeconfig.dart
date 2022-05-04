import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight=size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
  }
}
