import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider((ref) {
  return AuthService();
});

class AuthService {
  final _name = "AUTH_SERVICE";

  AuthService();
}
