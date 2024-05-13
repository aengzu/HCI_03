import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/image_assets.dart';

class MissionsWidget extends StatelessWidget {
  final Map mission;
  final Function(int) onMissionClick;
  final int index;

  const MissionsWidget(
      {super.key,
      required this.mission,
      required this.onMissionClick,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                onMissionClick(index);
              },
              child: mission["checked"]
                  ? Image.asset(
                      ImageAssets.checkedOwn,
                      width: 24,
                      height: 24,
                    )
                  : Image.asset(
                      ImageAssets.uncheckedOwn,
                      width: 24,
                      height: 24,
                    )),
          IntrinsicWidth(
            child: Text(mission["mission_name"],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500)),
          ),
          Image.asset(ImageAssets.uncheckedOpposite),
        ],
      ),
    );
  }
}
