import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../exports.dart';

final initControllerProvider = Provider((ref) => InitController(ref: ref));

class InitController {
  final Ref _ref;

  InitController({required Ref ref}) : _ref = ref;

  Future initUserAndToken() async {
    log("INITIALISATION USER", name: "INIT CONTROLLER");

    _ref
        .read(currentUserProvider.notifier)
        .update((state) => _ref.read(hiveControllerPovider).getUser());
  }

  Future initScore() async {
    log("INITIALISATION SCORES", name: "INIT CONTROLLER");

    _ref
        .read(currentScoreProvider.notifier)
        .update((state) => _ref.read(hiveControllerPovider).getScore());
  }
}
