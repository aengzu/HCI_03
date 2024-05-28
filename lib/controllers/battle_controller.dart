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
    battleTasks: [],
  ).obs;

  var opponentName = '';
  var opponentId = '';

  final BattleService battleService = BattleService();
  final FriendController friendController = Get.put(FriendController());
  final UserController userController = Get.find<UserController>();

  @override
  void onInit() {
    super.onInit();
    fetchBattle(userController.user.value.memberId); // 사용자 ID로 배틀 정보 가져오기
  }

  // 배틀을 등록한다. (신청)
  Future<void> registerBattle(String challengeeId, String challengerId, String tasks) async {
    isLoading.value = true;
    errorMessage.value = '';
    BattleDto battleDto;

    try {
      battleDto = BattleDto(
        challengeeId: challengeeId,
        challengerId: challengerId,
        tasks: tasks,
      );

      await battleService.registerBattle(battleDto);

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
      if (battle.value.challengee == memberId) {
        opponentId = battle.value.challenger;
      } else if (battle.value.challenger == memberId) {
        opponentId = battle.value.challengee;
      }
      await _fetchOpponentName(opponentId); // opponentId 설정 후 호출

    } catch (e) {
      errorMessage.value = 'Failed to load battle: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // 배틀 상대의 이름을 가져온다.
  Future<void> _fetchOpponentName(String opponentId) async {
    try {
      String memberId = userController.user.value.memberId;
      await friendController.fetchFriends(memberId);
      var friend = friendController.friends.firstWhereOrNull((friend) => friend.friendId.memberId == opponentId);
      opponentName = friend!.friendId.name;
    } catch (e) {
      opponentName = '없음';
    }
  }
}
