import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/user_model.dart';


class UserController extends GetxController {
  late UserRepository userRepository;
  RxList<UserModel> userDataList = <UserModel>[].obs;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    userRepository = UserRepository();
  }

  void loadUser() async {
    await Future.delayed(const Duration(milliseconds: 0));
    final userList = await userRepository.getUserInfo();
    userDataList.value = userList;
    loading = false;
  }
}

class UserRepository {
  Future<List<UserModel>> getUserInfo() async {
    try {
      final userInfo =
      await http.get(Uri.parse('https://randomuser.me/api/?results=30/'));
      if (userInfo.statusCode == 200) {
        var userInfoData = jsonDecode(userInfo.body);
        List<UserModel> userList = userInfoData['results']
            .map<UserModel>((data) => UserModel.fromJson(data))
            .toList();
        return userList;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}