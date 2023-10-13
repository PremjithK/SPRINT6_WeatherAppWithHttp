import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MiniState extends StatelessWidget {
  const MiniState({
    required this.value,
    required this.icon,
    super.key,
  });
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(value),
      ],
    );
  }
}

class AdditionalStats extends StatelessWidget {
  const AdditionalStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MiniState(
          icon: FontAwesomeIcons.wind,
          value: '35246',
        ),
      ],
    );
  }
}
