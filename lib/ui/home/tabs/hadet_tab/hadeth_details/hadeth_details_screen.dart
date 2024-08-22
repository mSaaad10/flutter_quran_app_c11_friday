import 'package:flutter/material.dart';
import 'package:islami_c11_friday/providers/settings_provider/settings_provider.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadeth_details/hadith_content_widget.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadeth_tab.dart';
import 'package:islami_c11_friday/utils/image_utils.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadith_details';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    HadithItem hadithItem = ModalRoute.of(context)?.settings.arguments as HadithItem;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(getImagePathByName(imageName: provider.getBackgroundImageName())),
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
                  margin: EdgeInsets.symmetric(vertical: 24,horizontal: 14),
                  elevation: 12,
                  color: Colors.white,
                  child: HadithContentWidget(content: hadithItem.content),//-------------------------
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
