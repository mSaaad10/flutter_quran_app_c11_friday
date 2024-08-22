import 'package:flutter/material.dart';
import 'package:islami_c11_friday/utils/image_utils.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  double angelConunt = 0;
  List<String> Azkarr = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
  ];
  int lableText = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, right: 8, left: 50),
              child: Image.asset(
                  getImagePathByName(imageName: 'head of seb7a_light.png')),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Transform.rotate(
                angle: angelConunt,
                child: GestureDetector(
                  onTap: () {
                    OnTap();
                  },
                  child: Image.asset(
                      getImagePathByName(imageName: 'body of seb7a_light.png')),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 2),
          child: Text(
            "عدد التسبيحات",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 27),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(30)),
              child: Text("$counter",
                  style: Theme.of(context).textTheme.labelMedium),
            ),
          ),),
        Padding(padding: EdgeInsets.only(top: 15),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Text("${Azkarr[lableText]}",
                  style: Theme.of(context).textTheme.labelMedium),
            ),
          ),
        ),
      ],
    );
  }

  OnTap() {
    counter++;
    if (counter % 33 == 0) {
      lableText++;
      //counter++;
      counter = 0;
    }
    if (lableText == Azkarr.length) {
      lableText = 0;
    }
    angelConunt += 360 / 4;
    setState(() {});
  }
}
