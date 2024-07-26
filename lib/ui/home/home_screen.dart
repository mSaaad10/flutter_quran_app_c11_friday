import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_c11_friday/ui/home/tabs/hadet_tab/hadeth_tab.dart';
import 'package:islami_c11_friday/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_c11_friday/ui/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_c11_friday/ui/home/tabs/tasbeh_tab/tasbeh_tab.dart';
import 'package:islami_c11_friday/utils/image_utils.dart';

class HomeScreen extends StatefulWidget {
  static const String routeNAme = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(getImagePathByName(imageName: 'main_background.png')),
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Islami',
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).colorScheme.primary,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex, // 1
            onTap: (index) {
              // 2
              selectedIndex = index; // 2
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  //backgroundColor: Color(0xFFB7935F),
                  icon: ImageIcon(
                      AssetImage(getImagePathByName(imageName: 'quran.png'))),
                  label: 'Quran'),
              BottomNavigationBarItem(
                  //backgroundColor: Color(0xFFB7935F),

                  icon: ImageIcon(AssetImage(
                      getImagePathByName(imageName: 'hadeth_ic.png'))),
                  label: 'Hadeth'),
              BottomNavigationBarItem(
                  //backgroundColor: Color(0xFFB7935F),

                  icon: ImageIcon(
                      AssetImage(getImagePathByName(imageName: 'sebha.png'))),
                  label: 'Tasbeh'),
              BottomNavigationBarItem(
                  // backgroundColor: Color(0xFFB7935F),

                  icon: ImageIcon(
                      AssetImage(getImagePathByName(imageName: 'radio.png'))),
                  label: 'Radio'),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTab()];
}
