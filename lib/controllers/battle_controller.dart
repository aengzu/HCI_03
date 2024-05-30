import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hci_03/models/battle_dto.dart';
import 'package:hci_03/models/battle.dart';
import 'package:hci_03/controllers/friends_controller.dart';
import 'package:hci_03/controllers/user_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizing/sizing.dart';
import 'dart:io';
import '../constants/image_assets.dart';
import '../constants/theme.dart';
import '../models/battletask_dto.dart';
import '../models/task_dto.dart';
import '../screens/components/small_btn.dart';
import '../screens/components/small_grey_btn.dart';
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
    battleTasks: [],
  ).obs;

  var opponentName = '';
  var opponentId = '';
  final ImagePicker _picker = ImagePicker();
  Rxn<File> selectedImage = Rxn<File>();

  final BattleService battleService = BattleService();
  final FriendController friendController = Get.put(FriendController());
  final UserController userController = Get.find<UserController>();

  @override
  void onInit() {
    super.onInit();
    fetchBattle(userController.user.value.memberId); // 사용자 ID로 배틀 정보 가져오기
  }

  // 이미지 고르기
  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        selectedImage.value = File(image.path);
        print("Image Path: ${image.path}");
      }
    } catch (e) {
      print("Image picker error: $e");
    }
  }

  // 챌린저인지 챌린지인지에 따라 다른 이미지 리턴
  String getProfileImage() {
    String memberId = userController.user.value.memberId;
    if (battle.value.challenger == memberId) {
      return ImageAssets.sender;
    } else if (battle.value.challengee == memberId) {
      return ImageAssets.receiver;
    }
    return ImageAssets.defaultProfile;
  }

  // 챌린저인지 챌린지인지에 따라 다른 이미지 리턴
  String getOpponentProfileImage() {
    String memberId = userController.user.value.memberId;
    if (battle.value.challenger == memberId) {
      return ImageAssets.receiver;
    } else if (battle.value.challengee == memberId) {
      return ImageAssets.sender;
    }
    return ImageAssets.defaultProfile;
  }

  // 인증 팝업 띄우기
  void onClickCertification(BuildContext context, String missionText, int battleNo, int taskNo) {
    selectedImage.value = null; // 초기화
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Center(
              child: Container(
                width: 0.8.sw,
                height: 0.75.sh,
                padding: EdgeInsets.symmetric(vertical: 0.05.sh),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    // 내 프로필
                    Image.asset(
                      getProfileImage(),
                      width: 0.3.sw,
                      height: 0.2.sh,
                    ),
                    SizedBox(height: 0.01.sh),
                    Text(
                      missionText,
                      style: textTheme().bodyMedium,
                    ),
                    SizedBox(height: 0.02.sh),
                    ElevatedButton(
                      onPressed: () async {
                        await pickImage(ImageSource.gallery);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4c4c4c),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: const Color(0xffbcb7b7).withOpacity(0.25),
                      ),
                      child: Text(
                        '(갤러리에서 인증 사진 첨부)',
                        style: textTheme().displaySmall,
                      ),
                    ),
                    SizedBox(height: 0.05.sh),
                    Obx(() {
                      print(selectedImage.value);
                      if (selectedImage.value != null) {
                        return Image.file(
                          selectedImage.value!,
                          width: 0.35.sw,
                          height: 0.15.sh,
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Container(height: 0.15.sh, child: Text('사진을 선택하세요', style: textTheme().bodyMedium));
                      }
                    }),
                    SizedBox(height: 0.05.sh),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SmallGreyButton(
                          label: ' 취소 ',
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SmallButton(label: '인증전송', onPressed: () async {
                          if (selectedImage.value != null) {
                            await uploadTaskImage(
                              TaskDto(
                                battleNo: battleNo,
                                memberNo: userController.user.value.memberId,
                                taskNo: taskNo.toString(),
                              ),
                              selectedImage.value!,
                            );
                            Navigator.of(context).pop();
                          }
                        },)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> uploadTaskImage(TaskDto taskDto, File imageFile) async {
    try {
      await battleService.uploadTaskImage(taskDto, imageFile);
      updateCheckStatus(taskDto);
    } catch (e) {
      errorMessage.value = 'Failed to upload image and check task: $e';
      updateCheckStatus(taskDto);
    }
  }

  void updateCheckStatus(TaskDto taskDto) {
    for (var task in battle.value.battleTasks) {
      if (task.battleTaskNo == taskDto.battleNo && task.task.taskNo.toString() == taskDto.taskNo) {
        task.check = true;
        break;
      }
    }
    battle.refresh();
  }

  // 배틀을 등록한다. (신청)
  Future<void> registerBattle(String challengeeId, String challengerId, String taskNos) async {
    isLoading.value = true;
    errorMessage.value = '';
    BattleDto battleDto;

    try {
      battleDto = BattleDto(
        challengeeId: challengeeId,
        challengerId: challengerId,
        tasks: taskNos,
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
      await _fetchOpponentName(opponentId);
    } catch (e) {
      errorMessage.value = 'Failed to load battle: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _fetchOpponentName(String opponentId) async {
    try {
      String memberId = userController.user.value.memberId;
      await friendController.fetchFriends(memberId);
      var friend = friendController.friends.firstWhereOrNull((friend) => friend.friendId.memberId == opponentId);
      opponentName = friend?.friendId.name ?? '없음';
    } catch (e) {
      opponentName = '없음';
    }
  }

  // 상대방 정보 가져오기
  Future<void> fetchOpponent() async {
    try {
      String memberId = userController.user.value.memberId;
      String opponentId = battle.value.challenger == memberId ? battle.value.challengee : battle.value.challenger;
      await _fetchOpponentName(opponentId);
    } catch (e) {
      errorMessage.value = 'Failed to load opponent: $e';
    }
  }

  // 배틀 수락하기
  Future<void> acceptBattle(String taskNos) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      var battleTaskDto = BattleTaskDto(
        battleNo: battle.value.battleNo,
        challengeeId: userController.user.value.memberId,
        challengerId: battle.value.challenger,
        tasks: taskNos,
      );
      await battleService.acceptBattle(battleTaskDto);
      fetchBattle(userController.user.value.memberId);
    } catch (e) {
      errorMessage.value = 'Failed to accept battle: $e';
    } finally {
      isLoading.value = false;
    }
  }


  // 태스크를 그룹화하여 같은 태스크를 한 줄에 표시하기 위한 리스트 생성
  List<Map<String, dynamic>> getGroupedMissions(String userId) {
    Map<String, Map<String, dynamic>> groupedMissions = {};
    for (var task in battle.value.battleTasks) {
      // TODO: 만약 task 의 memberNo 가 상대일 때의 처리 -> 우선은 X
      if (task.memberNo != userId) {
         continue;
      }

      print(battle.value.battleTasks[0].toJson());
      String taskName = task.task.taskName;
      bool isMine = task.memberNo == userId;
      bool check = task.check;

      if (!groupedMissions.containsKey(taskName)) {
        groupedMissions[taskName] = {
          "taskName": taskName,
          "myCheck": isMine ? check : null,
          "opponentCheck": !isMine ? check : null,
          "battleNo": task.battleTaskNo, // int 타입 유지
          "taskNo": task.task.taskNo,    // int 타입 유지
        };
      } else {
          groupedMissions[taskName]!["myCheck"] = check;
      }
    }
    return groupedMissions.values.toList();
  }
}
