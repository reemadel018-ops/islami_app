import 'package:islami_app/core/shared_prefs_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void getLastSuraIndex() async {
    var prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndexListAsString =
        prefs.getStringList(SharedPrefsKey.key) ?? [];
    mostRecentList = mostRecentIndexListAsString.map((index) {
      return int.parse(index);
    }).toList();
    notifyListeners();

    // return mostRecentIndexListAsInt.reversed.toList();
  }
}
