// ignore_for_file: public_member_api_docs, sort_constructors_first

class Score {
  final int totalMatch;
  final int winMatch;
  final int lostMatch;
  Score({
    this.totalMatch = 0,
    this.winMatch = 0,
    this.lostMatch = 0,
  });

  Score copyWith({
    int? totalMatch,
    int? winMatch,
    int? lostMatch,
  }) {
    return Score(
      totalMatch: totalMatch ?? this.totalMatch,
      winMatch: winMatch ?? this.winMatch,
      lostMatch: lostMatch ?? this.lostMatch,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'totalMatch': totalMatch,
      'winMatch': winMatch,
      'lostMatch': lostMatch,
    };
  }

  factory Score.fromMap(Map<dynamic, dynamic> map) {
    return Score(
      totalMatch: map['totalMatch'] as int,
      winMatch: map['winMatch'] as int,
      lostMatch: map['lostMatch'] as int,
    );
  }
}
