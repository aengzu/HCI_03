import 'package:get/get.dart';
import 'package:hci_03/models/battle_dto.dart';
import 'package:hci_03/models/battle.dart';
import 'package:hci_03/controllers/friends_controller.dart';
import 'package:hci_03/controllers/user_controller.dart';
import '../models/battletask_dto.dart';
import '../service/battle_service.dart';
import '../service/notification_service.dart';

// NOTE: 배틀 상태 및 상대를 관리하기 위한 컨트롤러입니다.
class BattleController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var battle = Battle(
    battleNo: 0,
    challenger: '',
    challengee: '',
    createAt: '',
    status: '',
    reward: null,
    accept: false,
  ).obs;

  var opponentName = ''.obs;

  // 배틀 서비스를 통해 서버와 직접적으로 소통합니다.
  final BattleService battleService = BattleService();
  // 알림 서비스를 통해 배틀 신청 시 수락자에게 알림을 보내야합니다.
  final NotificationService notificationService = NotificationService();
  // 현재 선택된 친구에 대해 Id 만 알 수 있습니다. 그래서 이름을 가져오기 위해 친구 컨트롤러를 사용했습니다.
  final FriendController friendController = Get.put(FriendController());
  // 현재 나의 정보(Id)가 필요하게 됩니다. (배틀 신청 및 수락 시)
  final UserController userController = Get.find<UserController>();

  // 배틀을 등록한다. (신청)
  Future<void> registerBattle(String challengeeId, String challengerId, String tasks) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      BattleDto battleDto = BattleDto(
        challengeeId: challengeeId,
        challengerId: challengerId,
        tasks: tasks,
      );
      await battleService.registerBattle(battleDto);

      // 알림 보내기
      String message = '${userController.user.value.name}님이 대결을 신청했습니다.';
      await notificationService.sendNotification(challengeeId, message);

    } catch (e) {
      errorMessage.value = 'Failed to register battle: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // 배틀 정보를 가져온다.
  Future<void> fetchBattle(String memberId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      battle.value = await battleService.getBattle(memberId);
      await _fetchOpponentName(battle.value.challenger);
    } catch (e) {
      errorMessage.value = 'Failed to load battle: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // 배틀 상대의 이름을 가져온다.
  Future<void> _fetchOpponentName(String challengeeId) async {
    try {
      String memberId = userController.user.value.memberId;
      await friendController.fetchFriends(memberId);
      var friend = friendController.friends.firstWhereOrNull((friend) =>
      friend.friendId.memberId == challengeeId);
      opponentName.value = friend?.friendId.name ?? '없음';
    } catch (e) {
      opponentName.value = '없음';
    }
  }

  // 배틀을 수락하는 메서드
  // TODO : 현재 배틀 수락 시 status 가 waiting 에서 변경 되지 않아 서버와 소통 후 고치겠습니다.+알림기능
  Future<void> acceptBattle(int battleNo, String challengeeId, String challengerId, String tasks) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      BattleTaskDto battleTaskDto = BattleTaskDto(
        battleNo: battleNo,
        challengeeId: challengeeId,
        challengerId: challengerId,
        tasks: tasks,
      );
      await battleService.acceptBattle(battleTaskDto);
    } catch (e) {
      errorMessage.value = 'Failed to accept battle: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
