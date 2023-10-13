import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/_config/layouts.dart';
import 'package:weather_app/_config/text_styles.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo({
    required this.locationName,
    required this.time,
    super.key,
  });
  final String locationName;
  final String time;
  @override
  Widget build(BuildContext context) {
    final textColor = Colors.black.withOpacity(0.7);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: GlobalInsets.containerPadding * 2, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(locationName)
              .text
              .color(textColor)
              .letterSpacing(0)
              .size(TextSize.h5)
              .fontWeight(FontWeight.bold)
              .make(),
          Text(time).text.color(textColor).letterSpacing(0).size(TextSize.h5).make(),
        ],
      ),
    );
  }
}
