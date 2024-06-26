import 'package:get/get.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/models/friend_dto.dart';
import 'package:hci_03/service/friend_service.dart';

// NOTE: 친구 목록을 가져오고 추가하기 위한 컨트롤러 입니다.
class FriendController extends GetxController {
  var isLoading = false.obs;
  var friends = <FriendResponse>[].obs;
  var errorMessage = ''.obs;

  final FriendService friendService = FriendService();

  Future<void> registerFriend(String friendId, String memberId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // 내 아이디와 친구 아이디로 FriendDto 를 보냅니다.
      FriendDto friendDto = FriendDto(friendId: friendId, memberId: memberId);
      await friendService.registerFriend(friendDto);
      await fetchFriends(memberId); // 친구 추가 후 친구 목록 새로고침
    } catch (e) {
      errorMessage.value = '친구 등록 실패: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchFriends(String memberId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      friends.value = await friendService.getFriends(memberId);
    } catch (e) {
      errorMessage.value = '친구가 없습니다. : $e';
    } finally {
      isLoading.value = false;
    }
  }
}
