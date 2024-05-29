class FriendDto {
  final String friendId;
  final String memberId;

  FriendDto({
    required this.friendId,
    required this.memberId,
  });

  Map<String, dynamic> toJson() {
    return {
      'friendId': friendId,
      'memberId': memberId,
    };
  }
}
