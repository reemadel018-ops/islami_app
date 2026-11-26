import 'package:flutter/foundation.dart';

class SebhaProvider extends ChangeNotifier {
  final List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  int azkarIndex = 0;
  int counter = 0;
  int totalTaps = 0;

  String get currentZekr => azkar[azkarIndex];
  double get turns => totalTaps / 33;

  void increment() {
    if (counter == 33) {
      counter = 0;
      azkarIndex = (azkarIndex + 1) % azkar.length;
    }
    counter++;
    totalTaps++;
    notifyListeners();
  }
}