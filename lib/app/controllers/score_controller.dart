import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocab_vortex/exports.dart';

final scoreControllerProvider = Provider((ref) {
  final service = ref.watch(scoreServiceProvider);
  return ScoreController(service: service, ref: ref);
});

class ScoreController {
  final ScoreService _service;
  final Ref _ref;

  ScoreController({required ScoreService service, required Ref ref})
      : _service = service,
        _ref = ref;

  Future<void> addScore({required bool win}) async {
    try {
      Map<String, dynamic> score = {
        "totalMatch": _ref.read(currentScoreProvider).totalMatch + 1,
        'winMatch': _ref.read(currentScoreProvider).winMatch,
        "lostMatch": _ref.read(currentScoreProvider).lostMatch
      };

      if (win) {
        score["winMatch"] = _ref.read(currentScoreProvider).winMatch + 1;
      } else {
        score["lostMatch"] = _ref.read(currentScoreProvider).lostMatch + 1;
      }

      _ref.read(hiveControllerPovider).setScore(score: Score.fromMap(score));

      // Initialisation des données
      _ref.read(initControllerProvider).initScore();
    } catch (e) {
      log("$e", name: "ERROR");
    }
  }
}
