import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocab_vortex/app/models/word.dart';
import 'package:vocab_vortex/exports.dart';

final geminiControllerProvider = Provider((ref) {
  final service = ref.watch(geminiServiceProvider);
  return GeminiController(service: service);
});

class GeminiController {
  final GeminiService _service;

  GeminiController({required GeminiService service}) : _service = service;

  Future<Word?> getWord() async {
    final result = await _service.getWord(PromptString.wordPrompt);

    if (result != null) {
      String cleanedResponse = result.replaceAll(RegExp(r'```json\n*'), '');
      cleanedResponse = cleanedResponse.replaceAll(RegExp(r'```'), '');
      dynamic data = jsonDecode(cleanedResponse);
      Word word = Word.fromMap(data);

      return word;
    } else {
      return null;
    }
  }
}
