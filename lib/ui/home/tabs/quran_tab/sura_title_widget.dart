import 'package:flutter/material.dart';
import 'package:islami_c11_friday/ui/home/tabs/quran_tab/quran_details/quran_details.dart';

class SuraTitleWidget extends StatelessWidget {
  String suraTitle;
  String numOfVerse;
  int index;

  SuraTitleWidget(
      {required this.suraTitle, required this.numOfVerse, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          QuranDetailsScreen.routeName,
          arguments: SuraArguments(suraTitle: suraTitle, index: index),
        );
      },
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
                child: Text(
              suraTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            )),
            Container(
              width: 2,
              color: Color(0xFFB7935F),
            ),
            Expanded(
                child: Text(
              numOfVerse,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ))
          ],
        ),
      ),
    );
  }
}

class SuraArguments {
  String suraTitle;
  int index;

  SuraArguments({required this.suraTitle, required this.index});
}
