import 'package:get/get.dart';
import 'package:hci_03/models/battle_dto.dart';


import '../service/battel_service.dart';

class BattleController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final BattleService battleService = BattleService();

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
    } catch (e) {
      errorMessage.value = 'Failed to register battle: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
