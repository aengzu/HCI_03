class Battle {
  final int battleNo;
  final String challenger;
  final String challengee;
  final String createAt;
  final String status;
  final String? reward;
  final bool accept;

  Battle({
    required this.battleNo,
    required this.challenger,
    required this.challengee,
    required this.createAt,
    required this.status,
    this.reward,
    required this.accept,
  });

  factory Battle.fromJson(Map<String, dynamic> json) {
    return Battle(
      battleNo: json['battleNo'],
      challenger: json['challenger'],
      challengee: json['challengee'],
      createAt: json['createAt'],
      status: json['status'],
      reward: json['reward'],
      accept: json['accept'],
    );
  }
}
