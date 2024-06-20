import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocab_vortex/app/controllers/hive_controller.dart';
import 'package:vocab_vortex/app/models/score.dart';
import 'package:vocab_vortex/app/models/user.dart';

/// Watch the [authTokenProvider] to check if the user is logged in.

final currentUserProvider =
    StateProvider<User?>((ref) => ref.read(hiveControllerPovider).getUser());

final currentScoreProvider =
    StateProvider<Score>((ref) => ref.read(hiveControllerPovider).getScore());
