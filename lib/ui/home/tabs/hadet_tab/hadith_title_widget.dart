import 'package:flutter/material.dart';

class HadithTitleWidget extends StatelessWidget {
  String hadithTitle;

  HadithTitleWidget({required this.hadithTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Text(
        hadithTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }
}
