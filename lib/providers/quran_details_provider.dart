import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranDetailsProvider extends ChangeNotifier {
  List<String> quran = [];

  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');
    quran = suraLines;
    notifyListeners();
  }
}
