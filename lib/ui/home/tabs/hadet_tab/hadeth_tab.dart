import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadith_title_widget.dart';
import 'package:islami_c11_friday/utils/image_utils.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadithItem> HadithList = [];

  @override
  Widget build(BuildContext context) {
    if (HadithList.isEmpty) loadHadithFile();
    return Container(
      child: HadithList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset(getImagePathByName(imageName: 'hadith_header.png'))),
                Expanded(
                  flex: 2,
                  child: ListView.separated(
                      itemBuilder: (context, index) =>HadithTitleWidget(hadithTitle: HadithList[index].title ) ,
                      separatorBuilder: (context, index) => Divider(color: Color(0xFF87935F),),
                      itemCount: HadithList.length),
                )
              ],
            ),
    );
  }

  void loadHadithFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    var allAhadith = fileContent.trim().split('#');
    allAhadith.forEach((element){
      print(element);
    },);
    for (int i = 0; i < allAhadith.length; i++) {
      List<String> hadithLines = allAhadith[i].trim().split('\n');
      String hadithTitle = hadithLines[0];
      hadithLines.removeAt(0);
      String hadithContent = hadithLines.join('\n');
      HadithItem hadithItem =
          HadithItem(title: hadithTitle, content: hadithContent);
      HadithList.add(hadithItem);
    }
  }
}

class HadithItem {
  String title;
  String content;
  HadithItem({required this.title, required this.content});
}
