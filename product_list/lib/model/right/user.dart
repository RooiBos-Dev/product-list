class User {
  final String? username;
  final String? password;
  final String? sessionId;

  const User({
    this.username,
    this.password,
    this.sessionId,
  });

  factory User.fromJson(dynamic json) {
    return User(
      username: json['username'] != null ? json["username"] : null,
      password: json['password'] != null ? json["password"] : null,
      sessionId: json['session_id'] != null ? json["session_id"] : null,
    );
  }
}
