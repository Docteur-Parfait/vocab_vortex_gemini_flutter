import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocab_vortex/app/models/score.dart';
import 'package:vocab_vortex/app/models/user.dart';
import 'package:vocab_vortex/globals/config.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  final String _scoreKey = "SCORE_TOKEN";
  final String _currentUserKey = "CURRENT_USER";
  final _name = "HIVE_SERVICE";

// Utilisateur actuel
  User? getCurrentUser() {
    final data = Hive.box("app_data").get(_currentUserKey);
    if (AppConfig.devMode) {
      log("Reading user", name: _name);
      log("Data : $data", name: _name);
    }
    final user = data != null ? User.fromMap(jsonDecode(data)) : null;
    return user;
  }

  void setCurrentUser(User user) {
    if (AppConfig.devMode) {
      log("Saving user", name: _name);
      log("Data : ${user.toMap()}", name: _name);
    }
    Hive.box("app_data").put(_currentUserKey, jsonEncode(user.toMap()));
  }

  // Score state
  Score getScore() {
    final data = Hive.box("app_data").get(_scoreKey);
    if (AppConfig.devMode) {
      log("Reading Score state", name: _name);
      log("Data : $data", name: _name);
    }
    final score = data != null ? Score.fromMap(data) : Score();
    return score;
  }

  void setScore(Score state) {
    if (AppConfig.devMode) {
      log("Saving Score state", name: _name);
      log("Data : ${state.toMap()}", name: _name);
    }
    Hive.box("app_data").put(_scoreKey, state.toMap());
  }

// Logout and clear
  void logout() {
    Hive.box("app_data").delete(_currentUserKey);
  }

  void clear() {
    Hive.box("app_data").clear();
  }
}
