import 'package:flutter/material.dart';

class NotesTabProvider with ChangeNotifier {
  bool _isScrolled = false;

  bool get isScrolled => _isScrolled;

  void setIsScrolled(bool value) {
    _isScrolled = value;
    notifyListeners();
  }
}
