import 'package:rent_ready_app/core/contstants/SharedPreferenceConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreference {
  static final SharedPreference _preference = SharedPreference._internal();

  factory SharedPreference() {
    return _preference;
  }

  SharedPreference._internal();

  String selectedLanguage = '';

  Future setPreferredLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(languagePreference, language);
  }

  Future<String> getPreferredLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedLanguage = prefs.getString(languagePreference);
    if (selectedLanguage == null) setPreferredLanguage('');
    return selectedLanguage;
  }
}

SharedPreference preferences = SharedPreference();
