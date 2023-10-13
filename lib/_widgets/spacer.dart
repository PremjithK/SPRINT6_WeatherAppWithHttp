import 'package:flutter/material.dart';

// Spacer
Widget wSpacer(double value) => SizedBox(width: value);
Widget hSpacer(double value) => SizedBox(height: value);

//Divider
Widget divider([double? weight = 1, Color? color]) => Divider(
      thickness: weight,
      color: color,
    );
