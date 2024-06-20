import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:vocab_vortex/app/controllers/init_controller.dart';

import '../../exports.dart';
import '../services/auth_service.dart';

final authControllerProvider = Provider((ref) {
  final service = ref.watch(authServiceProvider);
  return AuthController(service: service, ref: ref);
});

class AuthController {
  final AuthService _service;
  final Ref _ref;

  AuthController({required AuthService service, required Ref ref})
      : _service = service,
        _ref = ref;

  Future<void> addName(BuildContext context,
      {Map<String, dynamic>? body}) async {
    // Vérifiez si le widget est toujours monté avant d'utiliser le BuildContext
    if (!context.mounted) return;

    _ref.read(hiveControllerPovider).setUser(user: User.fromMap(body!));

    // Initialisation des données
    _ref.read(initControllerProvider).initUserAndToken();
    // Redirection
    Get.back();
    Get.to(const HomeScreen());
  }
}
