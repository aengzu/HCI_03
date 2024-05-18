import 'package:hci_03/constants/image_assets.dart';
import 'package:hci_03/models/friend.dart';

class FriendsController {
  List<Friend> friends = [ // dummyFirneds
    Friend(id: "jyj", name: "전영주", profileImage: ImageAssets.sender, bio: "안녕하세요"),
    Friend(id: "kss", name: "김성수", profileImage: ImageAssets.sender, bio: "반가워요"),
    Friend(id: "kbj", name: "김병주", profileImage: ImageAssets.sender, bio: "같이 힘내봐요."),
    Friend(id: "jy", name: "장영", profileImage: ImageAssets.sender, bio: "아자아자"),
    Friend(id: "pjl", name: "박정록", profileImage: ImageAssets.sender, bio: "HCI 파이팅"),

  ];

  void addFriend(String id, String name) {
    friends.add(Friend(id: id, name: name, profileImage: ImageAssets.sender, bio: "No bio"));
  }
}

Friend? currentOpponent;

