import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late double screenWidth;

  init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
  }
}
