import 'package:flutter/material.dart';

class MainPageIndexer extends ChangeNotifier {
  int mainpageindex = 0;

  set setIndex(int index) {
    mainpageindex = index;
    notifyListeners();
  }
}
