import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hci_03/screens/battle/components/commentWidget.dart';
import 'package:hci_03/screens/battle/components/input_spur_comment_widget.dart';
import 'package:hci_03/screens/battle/components/spur_on_top_bar_widget.dart';
import 'package:hci_03/screens/components/appbar_preffered_size.dart';

class SpurOnScreen extends StatefulWidget {
  SpurOnScreen({super.key});

  List<Map> comments = [
    {"comment": "오늘도 열심히 하고 있어요!\n당신의 노력은 보람 있어요.", "checked": false},
    {"comment": "어떤 일이든 해낼 수 있어요!\n당신은 강하고 뛰어나니까요.", "checked": false},
    {"comment": "매일 조금씩 나아가는 것이 중요해요.\n오늘도 조금씩 나아가면 됩니다.", "checked": false},
    {"comment": "당신은 대단해요! \n괜찮아요, 조금만 더 힘내면 되죠.", "checked": false},
  ];

  @override
  State<SpurOnScreen> createState() => _SpurOnScreenState();
}

class _SpurOnScreenState extends State<SpurOnScreen> {
  Widget targetProfile() {
    return Column(children: [
      Text(
        '길동이',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 5.0,
      ),
      Image.asset(
        'assets/images/sender_img.png',
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
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        child: Column(
          children: [
            const SpurOnTopBarWidget(),
            const SizedBox(
              height: 25.0,
            ),
            targetProfile(),
            const SizedBox(
              height: 18.0,
            ),
            Flexible(
              flex: 2,
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
            Flexible(
                flex: 1,
                child: Column(
                  children: [
                    const InputSpurCommentWidget(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: const Color(0xff4cd663).withOpacity(0.7)),
                        child: Text(
                          '전송',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
