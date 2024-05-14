import 'package:hci_03/constants/image_assets.dart';

class Friend {
  String id;
  String name; // 유저 이름
  String profileImage; // 이미지 주소 - TODO : 서버 구현 하면 url 수정하기
  String bio; // 소개란

  Friend({required this.id, required this.name, required this.profileImage, required this.bio});

}

