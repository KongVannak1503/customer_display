import 'package:flutter/material.dart';

class TitleLgWidget extends StatelessWidget {
  final String text;
  const TitleLgWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
