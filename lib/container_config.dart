import 'package:flutter/material.dart';

class ContainerConfig with ChangeNotifier {
  double width = 200.0;
  double height = 200.0;
  double borderRadius = 0.0;

  void setWidth(double value) {
    width = value;
    notifyListeners();
  }

  void setHeight(double value) {
    height = value;
    notifyListeners();
  }

  void setBorderRadius(double value) {
    borderRadius = value;
    notifyListeners();
  }
}
