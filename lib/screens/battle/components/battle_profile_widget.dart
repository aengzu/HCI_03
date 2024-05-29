import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/image_assets.dart';
import 'package:hci_03/constants/theme.dart';

import '../../../controllers/battle_controller.dart';

class BattleProfileWidget extends StatelessWidget {
  final BattleController battleController = Get.find<BattleController>();
  final bool isProfileClicked;
  final double percentage;
  final Function onClickProfile;

  BattleProfileWidget(
      {super.key,
      required this.isProfileClicked,
      required this.percentage,
      required this.onClickProfile});

  Widget pieChart(double point, var context) {
    final List<double> dataPoints = [point, 100.0 - point];
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sections: getSections(dataPoints),
              centerSpaceRadius: 48, // 중앙 공간의 반경
              sectionsSpace: 0, // 섹션 사이의 간격
              startDegreeOffset: -90, // 회전 시작 각도
            ),
          ),
          Container(
              width: 95, // 컨테이너의 너비
              height: 95,
              decoration: const BoxDecoration(
                color: Color(0xffe6ffea),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('달성률',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w600)),
                  Text(
                    '${dataPoints[0].toInt()}%',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                  )
                ],
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '나',
          style: textTheme().titleMedium,
        ),
        const SizedBox(
          height: 5.0,
        ),
        GestureDetector(
          onTap: () {
            onClickProfile();
          },
          child: isProfileClicked
              ? pieChart(percentage, context)
              : Image.asset(
                  battleController.getProfileImage(),
                  width: 120,
                  height: 120,
                ),
        ),
      ],
    );
  }

  List<PieChartSectionData> getSections(List<double> dataPoints) {
    const radius = 10.0;
    final List<Color> colors = [
      const Color(0xff4CD663),
      const Color(0xffd8d8d8),
    ]; // 두 개의 섹션 색상

    return List.generate(dataPoints.length, (i) {
      final double value = dataPoints[i];
      final color = colors[i % colors.length];
      return PieChartSectionData(
        color: color,
        value: value,
        radius: radius,
        title: '',
      );
    });
  }
}
