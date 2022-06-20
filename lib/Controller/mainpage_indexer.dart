import 'package:flutter/material.dart';

class MainPageIndexer extends ChangeNotifier {
  int mainpageindex = 0;

  Future setIndex(int index) async{
    mainpageindex = index;
    notifyListeners();
  }
}
