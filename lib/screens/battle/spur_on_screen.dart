import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/screens/components/appbar_preffered_size.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import 'package:hci_03/screens/battle/components/commentWidget.dart';
import 'package:hci_03/screens/battle/components/input_spur_comment_widget.dart';
import 'package:hci_03/screens/battle/components/spur_on_top_bar_widget.dart';

import '../../controllers/battle_controller.dart';

class SpurOnScreen extends StatefulWidget {
  final String opponentName;

  SpurOnScreen({required this.opponentName, super.key});

  List<Map> comments = [
    {"comment": "오늘도 열심히 하고 있어요! 당신의 노력은 보람 있어요.", "checked": false},
    {"comment": "어떤 일이든 해낼 수 있어요! 당신은 강하고 뛰어나니까요.", "checked": false},
    {"comment": "매일 조금씩 나아가는 것이 중요해요. 오늘도 조금씩 나아가면 됩니다.", "checked": false},
    {"comment": "당신은 대단해요! 괜찮아요, 조금만 더 힘내면 되죠.", "checked": false},
  ];

  @override
  State<SpurOnScreen> createState() => _SpurOnScreenState();
}

class _SpurOnScreenState extends State<SpurOnScreen> {
  final BattleController battleController = Get.find<BattleController>();
  Widget targetProfile() {
    return Column(children: [
      Text(
        widget.opponentName,
        style: textTheme().titleMedium,
      ),
      const SizedBox(
        height: 5.0,
      ),
      Image.asset(
        battleController.getOpponentProfileImage(),
        width: 80,
        height: 80,
      )
    ]);
  }

  void onClickComment(int index) {
    setState(() {
      widget.comments[index]["checked"] = !widget.comments[index]["checked"];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Color(0xff4CD663),
          ),
        ),
        title: Text(
          '격려하기',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        bottom: appBarBottomLine(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
            const SpurOnTopBarWidget(),
            SizedBox(
              height: screenHeight * 0.035,
            ),
            targetProfile(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              height: screenHeight * 0.35,
              child: ListView.builder(
                itemCount: widget.comments.length,
                padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
                itemBuilder: (BuildContext context, int index) {
                  return CommentWidget(
                    comment: widget.comments[index],
                    onClickComment: onClickComment,
                    index: index,
                  );
                },
              ),
            ),
            Expanded(
                child: Column(
                  children: [
                    const InputSpurCommentWidget(),
                    SizedBox(
                      height: screenHeight * 0.022,
                    ),
                    CustomButtonLight(label: "전송", onPressed: () {
                      Navigator.pop(context);
                    })
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
