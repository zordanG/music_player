import 'package:flutter/material.dart';

class MusicChange extends ChangeNotifier {
  int index = 0;

  void chageMusic(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
