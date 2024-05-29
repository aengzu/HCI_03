import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/image_assets.dart';
import 'package:image_picker/image_picker.dart';

class MissionsWidget extends StatelessWidget {
  final Map mission;
  final Function(int) onMissionClick;
  final int index;

  const MissionsWidget(
      {super.key,
        required this.mission,
        required this.onMissionClick,
        required this.index});

  void onClickCertification(BuildContext context, String missionText) {
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
                height: 600,
                padding: const EdgeInsets.symmetric(
                    horizontal: 60.0, vertical: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/receiver_img.png',
                            width: 130,
                            height: 130,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            missionText,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                            // TODO : 카메라 연동 기능 추가하기
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? image = await picker.pickImage(
                                  source: ImageSource.camera);
                              if (image != null) {
                                // TODO: 이미지 업로드 로직 추가
                                print("Image Path: ${image.path}");
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 12.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xff4c4c4c),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xffbcb7b7)
                                          .withOpacity(0.25),
                                      offset: const Offset(0, 1),
                                    )
                                  ]),
                              child: Text('(인증 사진 첨부)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Flexible(
                      flex: 4,
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      onTap: () {
                        // 인증 전송 로직
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff4cd663),
                        ),
                        child: Text(
                          '인증전송',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      onMissionClick(index);
                      onClickCertification(context, mission["mission_name"]);
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
          ),
          Flexible(
            // 상대방의 인증 여부에 따라 visible/invisible and 상대가 사진 업로드 완료 시 상태 변경
            flex: 1,
            child: GestureDetector(
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xffbcb7b7).withOpacity(0.25),
                ),
                child: Text(
                  '인증',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
