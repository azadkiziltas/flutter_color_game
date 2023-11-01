import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'user_score_model.dart';

class SharedPreferencesHelper {
  static const String _userListKey = 'userList';

  static Future<void> saveUserSettingsList(List<UserScore> userList) async {
    final prefs = await SharedPreferences.getInstance();
    final userListJson = UserScore.toJsonList(userList);
    await prefs.setStringList(_userListKey, userListJson.map((e) => json.encode(e)).toList());
  }

  static Future<List<UserScore>> getUserSettingsList() async {
    final prefs = await SharedPreferences.getInstance();
    final userListJson = prefs.getStringList(_userListKey);

    if (userListJson != null) {
      final userList = UserScore.fromJsonList(userListJson.map((e) => json.decode(e)).toList());
      return userList;
    } else {
      return [];
    }
  }
}