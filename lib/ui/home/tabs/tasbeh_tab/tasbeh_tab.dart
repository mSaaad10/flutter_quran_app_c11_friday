import 'package:flutter/material.dart';
import 'package:islami_c11_friday/utils/image_utils.dart';

class TasbehTab extends StatelessWidget {
  const TasbehTab({super.key});

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
              child: Image.asset(
                  getImagePathByName(imageName: 'body of seb7a_light.png')),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 2),
          child: Text(
            "عدد التسبيحات",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 27),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text("33",style: Theme.of(context).textTheme.labelMedium),
          ),
        ),),
        Padding(padding: EdgeInsets.only(top: 15),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text("سبحان الله",style: Theme.of(context).textTheme.labelMedium),
          ),
        ),),
      ],
    );
  }
}
