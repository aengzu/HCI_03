import 'package:hci_03/constants/image_assets.dart';

class Friend {
  String name; // 유저 이름
  String profileImage; // 이미지 주소 - TODO : 서버 구현 하면 url 수정하기
  String bio; // 소개란

  Friend({required this.name, required this.profileImage, required this.bio});

}
  Friend? currentOpponent;

  List<Friend> dummyFriends = [ // dummy 데이터들. 서버 구현 시 삭제
    Friend(name: "전영주", profileImage: ImageAssets.sender, bio: "안녕하세요."),
    Friend(name: "김성수", profileImage: ImageAssets.sender, bio: "안녕하세요."),
    Friend(name: "김병주", profileImage: ImageAssets.sender, bio: "안녕하세요."),
    Friend(name: "장영", profileImage: ImageAssets.sender, bio: "안녕하세요."),
    Friend(name: "박정록", profileImage: ImageAssets.sender, bio: "안녕하세요."),

  ];
