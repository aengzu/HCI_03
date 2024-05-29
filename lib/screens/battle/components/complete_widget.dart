import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'battle_profile_widget.dart'; // BattleProfileWidget import
import 'battle_opposite.profile_widget.dart'; // BattleOppositeProfileWidget import

class CompleteWidget extends StatelessWidget {
  final bool isProfileClicked;
  final double myPercentage;
  final double gildongPercentage;
  final Function onClickProfile;

  const CompleteWidget(
      {super.key,
      required this.isProfileClicked,
      required this.myPercentage,
      required this.gildongPercentage,
      required this.onClickProfile});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffffe7f1),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffbcb7b7).withOpacity(0.25),
                    offset: const Offset(0, 1),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 10),
                Text(
                  '5월 1일 도전 완료!',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  '🔥 오늘 함께 달성한 목표 8개 🔥',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BattleProfileWidget(
                      isProfileClicked: isProfileClicked,
                      percentage: myPercentage,
                      onClickProfile: onClickProfile,
                    ),
                    BattleOppositeProfileWidget(),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '오늘 하루도 고생하셨어요 👏🏻',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
            textAlign: TextAlign.center,
          ),
          Text(
            '파트너에게 격려의 메시지를 보내고\n같이 더 멋진 내일을 보내는 건 어떨까요?',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '내가 달성하지 못한 태스크',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    _buildTextBox('영어단어 30개 외우기', const Color(0xFFA6EBB1)),
                    _buildTextBox('운동하기', const Color(0xFFA6EBB1)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '같이 성공한 태스크',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    _buildTextBox('아침 먹기', const Color(0xFFF0FF91)),
                    _buildTextBox('유산균 먹기', const Color(0xFFF0FF91)),
                    _buildTextBox('물 8컵 마시기', const Color(0xFFF0FF91)),
                    _buildTextBox('선크림 바르기', const Color(0xFFF0FF91)),
                    _buildTextBox('이불 정리하기', const Color(0xFFF0FF91)),
                    _buildTextBox('비타민 먹기', const Color(0xFFF0FF91)),
                    _buildTextBox('기상', const Color(0xFFF0FF91)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '길동이가 달성하지 못한 태스크',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    _buildTextBox('영어단어 50개 외우기', const Color(0xFFCDEBFC)),
                    _buildTextBox('운동하기', const Color(0xFFCDEBFC)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextBox(String text, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0), // More rounded corners
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12), // Black text color
        textAlign: TextAlign.center,
      ),
    );
  }
}
