import 'package:flutter/material.dart';

extension SpacingUtils on num {
  SizedBox get verticalSpace => SizedBox(height: toDouble());

  SizedBox get horizontalSpace => SizedBox(width: toDouble());

  double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * this;

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * this;
}
