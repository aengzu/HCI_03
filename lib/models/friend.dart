class Friend {
  final int memberNo;
  final String memberId;
  final String password;
  final String name;
  final String deviceKey;

  Friend({
    required this.memberNo,
    required this.memberId,
    required this.password,
    required this.name,
    required this.deviceKey,
  });

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      memberNo: json['memberNo'],
      memberId: json['memberId'],
      password: json['password'],
      name: json['name'],
      deviceKey: json['deviceKey'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberNo': memberNo,
      'memberId': memberId,
      'password': password,
      'name': name,
      'deviceKey': deviceKey,
    };
  }
}

class FriendResponse {
  final int friendNo;
  final String memberId;
  final Friend friendId;

  FriendResponse({
    required this.friendNo,
    required this.memberId,
    required this.friendId,
  });

  factory FriendResponse.fromJson(Map<String, dynamic> json) {
    return FriendResponse(
      friendNo: json['friendNo'],
      memberId: json['memberId'],
      friendId: Friend.fromJson(json['friendId']),
    );
  }
}
