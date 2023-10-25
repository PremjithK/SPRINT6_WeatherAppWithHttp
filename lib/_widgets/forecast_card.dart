import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/_config/layouts.dart';
import 'package:weather_app/_config/text_styles.dart';
import 'package:weather_app/_widgets/spacer.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({
    required this.temp,
    required this.time,
    required this.day,
    required this.condition,
    super.key,
  });
  final String temp;
  final String time;
  final String day;
  final String condition;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (condition) {
      case 'RAIN':
        icon = FontAwesomeIcons.cloudRain;
        break;
      case 'CLOUDS':
        icon = FontAwesomeIcons.cloudSun;
        break;
      case 'SUNNY':
        icon = Icons.wb_sunny;
        break;
      case 'CLEAR':
        icon = Icons.wb_sunny;
        break;
      default:
        icon = Icons.error;
        break;
    }

    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GlobalBorderRadius.containerRadius),
        color: Colors.deepOrange.withOpacity(0.15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day)
              .text
              .align(TextAlign.center)
              .color(Colors.deepOrange)
              .lineHeight(0)
              .size(TextSize.b2)
              .make(),
          hSpacer(6),
          Icon(
            icon,
            color: Colors.deepOrange,
            size: 72,
          ),
          hSpacer(6),
          Text('$temp°C')
              .text
              .color(Colors.deepOrange)
              .fontWeight(FontWeight.bold)
              .size(TextSize.h5)
              .make(),
        ],
      ),
    ).p(6);
  }
}
