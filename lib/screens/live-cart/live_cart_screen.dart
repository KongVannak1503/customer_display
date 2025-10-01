import 'package:flutter/material.dart';

class LiveCartScreen extends StatefulWidget {
  const LiveCartScreen({super.key});

  @override
  State<LiveCartScreen> createState() => _LiveCartScreenState();
}

class _LiveCartScreenState extends State<LiveCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [Text("Hello world")]));
  }
}
