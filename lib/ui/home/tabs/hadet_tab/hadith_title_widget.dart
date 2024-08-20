import 'package:flutter/material.dart';

class HadithTitleWidget extends StatelessWidget {
  String hadithTitle;
  HadithTitleWidget({required this.hadithTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:4 ),
      child: Text(
        hadithTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,

        ),
      ),
    );
  }
}
