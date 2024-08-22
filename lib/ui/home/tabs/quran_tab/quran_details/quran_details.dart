import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c11_friday/providers/quran_details_provider.dart';
import 'package:islami_c11_friday/providers/settings_provider/settings_provider.dart';
import 'package:islami_c11_friday/ui/home/tabs/quran_tab/quran_details/verse_widget.dart';
import 'package:islami_c11_friday/ui/home/tabs/quran_tab/sura_title_widget.dart';
import 'package:islami_c11_friday/utils/image_utils.dart';
import 'package:provider/provider.dart';

//import '../../../../../providers/settings_provider/settings_provider.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = '/quran_details';

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  //List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var quranDetailsProvider = Provider.of<QuranDetailsProvider>(context);
    var provider = Provider.of<SettingsProvider>(context);
    SuraArguments arguments =
        ModalRoute.of(context)?.settings.arguments as SuraArguments;
    // if (verses.isEmpty) loadFile(arguments.index);
    quranDetailsProvider.loadFile(arguments.index);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(getImagePathByName(imageName:  provider.getBackgroundImageName())),
      )),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(arguments.suraTitle),
          ),
          body: quranDetailsProvider.quran.isEmpty   //verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Card(
                  color: Colors.white,
                  elevation: 8,
                  margin: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        VerseWidget(verse: quranDetailsProvider.quran[index]),//verses[index]
                    separatorBuilder: (context, index) => Divider(
                        endIndent: 24, indent: 24, color: Theme.of(context).dividerColor),
                    itemCount: quranDetailsProvider.quran.length,
                  ),
                )),
    );
  }

  // void loadFile(int index) async {
  //   String fileContent =
  //       await rootBundle.loadString('assets/files/${index + 1}.txt');
  //   List<String> suraLines = fileContent.split('\n');
  //
  //   verses = suraLines;
  //
  //   suraLines.forEach(
  //     (element) {
  //       print(element);
  //     },
  //   );
  //   setState(() {});
  // }
}
