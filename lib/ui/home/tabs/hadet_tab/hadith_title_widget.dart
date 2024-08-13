import 'package:flutter/material.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadeth_details/hadith_details_screen.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadeth_tab.dart';

class HadithTitleWidget extends StatelessWidget {
  HadithItem hadithItem;

  HadithTitleWidget({required this.hadithItem, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadithDetailsScreen.routeName,
          arguments: hadithItem,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          hadithItem.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
