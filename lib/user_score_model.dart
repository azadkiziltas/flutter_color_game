class UserScore {
  final String username;
  final int score;

  UserScore({
    required this.username,
    required this.score,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'age': score,
    };
  }

  factory UserScore.fromJson(Map<String, dynamic> json) {
    return UserScore(
      username: json['username'],
      score: json['age'],
    );
  }

  static List<UserScore> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => UserScore.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<UserScore> users) {
    return users.map((user) => user.toJson()).toList();
  }
}