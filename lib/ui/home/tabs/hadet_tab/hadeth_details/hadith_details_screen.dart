import 'package:flutter/material.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadeth_details/hadith_content_widget.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadeth_tab.dart';
import 'package:islami_c11_friday/utils/image_utils.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadith_details';

  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hadithItem = ModalRoute.of(context)?.settings.arguments as HadithItem;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(getImagePathByName(imageName: 'main_background.png')),
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadithItem.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                  color: Colors.white,
                  elevation: 12,
                  child: HadithContentWidget(
                    content: hadithItem.content,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
