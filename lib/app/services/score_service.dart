import 'package:flutter_riverpod/flutter_riverpod.dart';

final scoreServiceProvider = Provider((ref) {
  return ScoreService();
});

class ScoreService {
  final _name = "Score_SERVICE";

  ScoreService();

  Future<String?> addScore(bool win) async {
    return null;
  }
}
