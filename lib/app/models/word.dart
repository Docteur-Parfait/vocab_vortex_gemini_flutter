// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Word {
  final String word;
  final String vortex;
  Word({
    required this.word,
    required this.vortex,
  });

  Word copyWith({
    String? word,
    String? vortex,
  }) {
    return Word(
      word: word ?? this.word,
      vortex: vortex ?? this.vortex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'vortex': vortex,
    };
  }

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      word: map['word'] as String,
      vortex: map['vortex'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Word.fromJson(String source) =>
      Word.fromMap(json.decode(source) as Map<String, dynamic>);
}
