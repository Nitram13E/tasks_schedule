import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final double margin;

  const InfoCard({super.key, required this.text, required this.margin});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(margin),
        child: Text(text),
      ),
    );
  }
}
