import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocab_vortex/app/models/score.dart';
import 'package:vocab_vortex/app/models/user.dart';
import 'package:vocab_vortex/app/services/hive_service.dart';

final hiveControllerPovider = Provider((ref) {
  final repo = ref.watch(hiveServiceProvider);
  return HiveController(repo: repo);
});

class HiveController {
  final HiveService _repo;

  HiveController({required HiveService repo}) : _repo = repo;

  User? getUser() {
    return _repo.getCurrentUser();
  }

  void setUser({required User user}) {
    _repo.setCurrentUser(user);
  }

  Score getScore() {
    return _repo.getScore();
  }

  void setScore({required Score score}) {
    _repo.setScore(score);
  }

  void logout() {
    return _repo.logout();
  }

  void clear() {
    return _repo.clear();
  }
}
