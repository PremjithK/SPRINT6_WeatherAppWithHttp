import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/_config/layouts.dart';
import 'package:weather_app/_config/text_styles.dart';

class MainWeatherDisplay extends StatefulWidget {
  const MainWeatherDisplay({
    required this.temp,
    required this.condition,
    super.key,
  });
  final double temp;
  final String condition;

  @override
  State<MainWeatherDisplay> createState() => _MainWeatherDisplayState();
}

class _MainWeatherDisplayState extends State<MainWeatherDisplay> {
  //

  @override
  Widget build(BuildContext context) {
    // Deciding Weather Condition Icon based on the condition name
    IconData weatherIcon;
    switch (widget.condition) {
      case 'Sunny':
        weatherIcon = FontAwesomeIcons.sun;
        break;
      case 'Rain':
        // weatherIcon = Icons.water_drop;
        weatherIcon = FontAwesomeIcons.cloudRain;
        break;
      case 'Clouds':
        // weatherIcon = Icons.water_drop;
        weatherIcon = FontAwesomeIcons.cloudSun;
        break;
      case 'Clear':
        // weatherIcon = Icons.water_drop;
        weatherIcon = Icons.wb_sunny;
        break;

      default:
        weatherIcon = Icons.error;
        break;
    }
    //
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(GlobalBorderRadius.containerRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Climate Icon
          Icon(
            weatherIcon,
            size: 60,
            color: Colors.white.withOpacity(0.85),
          ),
          //Temperature Number
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${widget.temp.round()}°')
                      .text
                      .size(75)
                      .color(
                        Colors.white.withOpacity(0.85),
                      )
                      .fontWeight(FontWeight.bold)
                      .lineHeight(0)
                      .align(TextAlign.center)
                      .letterSpacing(-2)
                      .make(),
                ],
              ),
              Text(widget.condition.toUpperCase())
                  .text
                  .size(TextSize.b1)
                  .color(
                    Colors.white.withOpacity(0.85),
                  )
                  .lineHeight(-1.4)
                  .make(),
            ],
          )
        ],
      ).p(GlobalInsets.containerPadding).px(12),
    );
  }
}
