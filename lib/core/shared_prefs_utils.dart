import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKey {
  static const String key = 'sura_index';
}

void saveLastSuraItem(int suraIndex) async {
  var prefs = await SharedPreferences.getInstance();
  List<String> mostRecentList = prefs.getStringList(SharedPrefsKey.key) ?? [];

  if (mostRecentList.contains("$suraIndex")) {
    mostRecentList.remove('$suraIndex');
    mostRecentList.insert(0, '$suraIndex');
  } else {
    mostRecentList.insert(0, '$suraIndex');
  }
  if (mostRecentList.length > 5) {
    mostRecentList.removeLast();
  }

  await prefs.setStringList(SharedPrefsKey.key, mostRecentList);
}


