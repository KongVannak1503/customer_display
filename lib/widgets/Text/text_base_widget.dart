import 'package:flutter/material.dart';

class TextBaseWidget extends StatelessWidget {
  final String text;
  const TextBaseWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
