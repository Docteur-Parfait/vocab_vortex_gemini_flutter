import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

final geminiServiceProvider = Provider((ref) {
  return GeminiService();
});

class GeminiService {
  final _name = "GEMINI_SERVICE";

  GeminiService()
      : _model = GenerativeModel(
          model: "gemini-1.5-flash-latest",
          apiKey: dotenv.get("API_KEY"),
        );

  final GenerativeModel _model;

  Future<String?> getWord(String prompt) async {
    log("Getting data", name: _name);

    try {
      final response = await _model.generateContent([
        Content.text(prompt),
      ]);
      log("Data get successfuly : ${response.text}", name: _name);

      return response.text;
    } catch (e) {
      log("Data get error", name: _name);

      return null;
    }
  }
}
