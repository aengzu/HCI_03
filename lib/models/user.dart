class User {
  final String deviceKey;
  final String memberId;
  final String name;
  final String password;

  User({
    required this.deviceKey,
    required this.memberId,
    required this.name,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      memberId: json['memberId'],
      password: json['password'],
      name: json['name'],
      deviceKey: json['deviceKey'],
    );
  }

  Map<String, String> toJson() {
    return {
      'deviceKey': deviceKey,
      'memberId': memberId,
      'name': name,
      'password': password,
    };
  }
}
