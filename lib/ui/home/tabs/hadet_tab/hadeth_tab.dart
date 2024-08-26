import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadith_title_widget.dart';
import 'package:islami_c11_friday/utils/image_utils.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadithItem> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) loadHadithFile(); // blocking thread
    return Container(
      child: hadithList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset(getImagePathByName(
                        imageName: 'hadith_header_image.png'))),
                Expanded(
                  flex: 2,
                  child: ListView.separated(
                      itemBuilder: (context, index) => HadithTitleWidget(
                            hadithItem: hadithList[index],
                          ),
                      separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 2,
                            color: Color(0xFFB7935F),
                            margin: EdgeInsets.symmetric(horizontal: 28),
                          ),
                      itemCount: hadithList.length),
                )
              ],
            ),
    );
  }

  void loadHadithFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allAhadith = fileContent.trim().split('#');
    //every index contain hadith
    allAhadith.forEach(
      (element) {
        print(element);
      },
    );
    //every index contain hadith
    for (int i = 0; i < allAhadith.length; i++) {
      List<String> hadithLines = allAhadith[i].trim().split('\n');
      //
      //      dart is fun

      String hadithTitle = hadithLines[0];
      hadithLines.removeAt(0);
      String hadithContent = hadithLines.join('\n');

      HadithItem hadithItem =
          HadithItem(title: hadithTitle, content: hadithContent);
      hadithList.add(hadithItem);
    }
    setState(() {});
  }
}

class HadithItem {
  String title;
  String content;

  HadithItem({required this.title, required this.content});
}
