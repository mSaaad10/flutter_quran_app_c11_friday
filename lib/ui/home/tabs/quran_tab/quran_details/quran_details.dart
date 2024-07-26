import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c11_friday/ui/home/tabs/quran_tab/quran_details/verse_widget.dart';
import 'package:islami_c11_friday/ui/home/tabs/quran_tab/sura_title_widget.dart';
import 'package:islami_c11_friday/utils/image_utils.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = '/quran_details';

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraArguments arguments =
        ModalRoute.of(context)?.settings.arguments as SuraArguments;
    if (verses.isEmpty) loadFile(arguments.index);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(getImagePathByName(imageName: 'main_background.png')),
      )),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(arguments.suraTitle),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Card(
                  color: Colors.white,
                  elevation: 8,
                  margin: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        VerseWidget(verse: verses[index]),
                    separatorBuilder: (context, index) => Divider(
                        endIndent: 24, indent: 24, color: Color(0xFFB7935F)),
                    itemCount: verses.length,
                  ),
                )),
    );
  }

  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');

    verses = suraLines;

    suraLines.forEach(
      (element) {
        print(element);
      },
    );
    setState(() {});
  }
}
