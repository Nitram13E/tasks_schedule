import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String text;
  final IconData icon;
  const NoData({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 250,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
