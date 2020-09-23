import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper{

  static read(String key) async{
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  static save(String key, value) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static remove(String key)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static containsKey(String key)async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }


}