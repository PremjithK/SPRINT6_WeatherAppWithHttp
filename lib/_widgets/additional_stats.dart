import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/_config/layouts.dart';
import 'package:weather_app/_config/text_styles.dart';
import 'package:weather_app/_widgets/spacer.dart';

class MiniStat extends StatelessWidget {
  const MiniStat({
    required this.value,
    required this.icon,
    super.key,
  });
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.deepOrange,
          size: 16,
        ),
        wSpacer(5),
        Text(value).text.size(TextSize.b1).lineHeight(0).make(),
      ],
    );
  }
}

class AdditionalStats extends StatelessWidget {
  const AdditionalStats({
    super.key,
    required this.windSpeed,
    required this.humidity,
    required this.minTemp,
    required this.maxTemp,
  });
  final String windSpeed;
  final String humidity;
  final String minTemp;
  final String maxTemp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MiniStat(
          icon: FontAwesomeIcons.wind,
          value: windSpeed,
        ),
        MiniStat(
          icon: FontAwesomeIcons.droplet,
          value: '$humidity%',
        ),
        MiniStat(
          icon: Icons.arrow_upward,
          value: '$minTemp°',
        ),
        MiniStat(
          icon: Icons.arrow_downward,
          value: '$maxTemp°',
        ),
      ],
    ).p(GlobalInsets.containerMargin);
  }
}
