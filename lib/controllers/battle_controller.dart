import 'package:get/get.dart';
import 'package:hci_03/models/battle_dto.dart';
import 'package:hci_03/models/battle.dart';

import 'package:hci_03/controllers/friends_controller.dart';
import 'package:hci_03/controllers/user_controller.dart';

import '../models/battletask_dto.dart';
import '../service/battle_service.dart';

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

  final BattleService battleService = BattleService();
  final FriendController friendController = Get.put(FriendController());
  final UserController userController = Get.find<UserController>();

  // 배틀을 등록한다. (신청)
  Future<void> registerBattle(String challengeeId, String challengerId,
      String tasks) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      BattleDto battleDto = BattleDto(
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
      await _fetchOpponentName(battle.value.challenger);
    } catch (e) {
      errorMessage.value = 'Failed to load battle: $e';
    } finally {
      isLoading.value = false;
    }
  }

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
  Future<void> acceptBattle(int battleNo, String challengeeId,
      String challengerId, String tasks) async {
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
