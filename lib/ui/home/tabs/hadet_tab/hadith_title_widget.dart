import 'package:flutter/material.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadeth_details/hadeth_details_screen.dart';

import 'hadeth_tab.dart';

class HadithTitleWidget extends StatelessWidget {
 HadithItem hadithItem;

  HadithTitleWidget({required this.hadithItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
        arguments: hadithItem

        );

      },

      child: Container(
        padding: EdgeInsets.symmetric(vertical:4 ),
        child: Text(
          hadithItem.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,

          ),
        ),
      ),
    );
  }
}
