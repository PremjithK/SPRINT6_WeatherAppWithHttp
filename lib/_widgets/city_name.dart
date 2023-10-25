import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
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
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(locationName)
              .text
              .letterSpacing(0)
              .size(TextSize.h4)
              .letterSpacing(-1)
              .fontWeight(FontWeight.bold)
              .make(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              //Text(time).text.color(textColor).letterSpacing(0).size(TextSize.b1).make(),
              IconButton(
                onPressed: () {},
                splashRadius: 16,
                icon: const Icon(
                  Icons.location_pin,
                  size: 24,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
