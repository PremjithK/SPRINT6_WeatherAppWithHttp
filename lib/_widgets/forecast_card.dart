import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/_config/layouts.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({
    required this.temp,
    required this.time,
    required this.icon,
    super.key,
  });
  final String temp;
  final String time;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GlobalBorderRadius.containerRadius),
        color: Colors.deepOrange.withOpacity(0.15),
      ),
      child: Column(
        children: [
          Text('$time'),
          Icon(icon),
          Text('$temp'),
        ],
      ),
    ).p(12);
  }
}
