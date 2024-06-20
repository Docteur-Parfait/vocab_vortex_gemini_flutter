class ValidatorMessage {
  static const emptyMessage = "Please fill the form";
}

class AppString {
  static const gameDescription =
      "You have to guess words in English from jumbled letters (vortex). If you guess the original word correctly, you've won.";
}

class PromptString {
  static const wordPrompt = '''
Generate a single English vocabulary word that a human would know, from a variety of categories such as fruits, household items, lifestyle, etc. Avoid repeating the same words. Each generated word should be different to ensure variety for a game. Provide the result in the following JSON format:

{
    "word": "ORIGINAL_WORD",
    "vortex": "SHUFFLED_WORD"
}

Example output:
{
    "word": "SCHOOL",
    "vortex": "LOCSHO"
}
''';
}
