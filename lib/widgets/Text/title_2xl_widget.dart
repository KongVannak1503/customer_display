import 'package:flutter/material.dart';

class Title2xlWidget extends StatelessWidget {
  final String text;
  const Title2xlWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
      softWrap: true,
      overflow: TextOverflow.visible,
    );
  }
}
