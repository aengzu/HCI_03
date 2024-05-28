import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hci_03/constants/image_assets.dart';
import 'package:sizing/sizing.dart';

import '../../../constants/theme.dart';

class MissionsWidget extends StatefulWidget {
  final Map mission;
  final Function(int) onMissionClick;
  final int index;

  const MissionsWidget({
    super.key,
    required this.mission,
    required this.onMissionClick,
    required this.index,
  });

  @override
  _MissionsWidgetState createState() => _MissionsWidgetState();
}

class _MissionsWidgetState extends State<MissionsWidget> {
  bool _isRequesting = false;

  Future<void> _pickImage() async {
    if (_isRequesting) return;
    setState(() {
      _isRequesting = true;
    });

    try {
      final ImagePicker picker = ImagePicker();
      var image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        // TODO: 이미지 업로드 로직 추가
        print("Image Path: ${image.path}");
      }
    } catch (e) {
      print("Camera not available: $e");
    } finally {
      setState(() {
        _isRequesting = false;
      });
    }
  }

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
                width: 0.8.sw,
                height: 0.7.sh,
                padding: EdgeInsets.symmetric(
                     vertical: 0.05.sh),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/receiver_img.png',
                      width: 0.3.sw,
                      height: 0.2.sh,
                    ),
                    Text(
                      missionText,
                      style: textTheme().bodyMedium,
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    ElevatedButton(
                      onPressed: _pickImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4c4c4c), // 배경 색상
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        shadowColor: const Color(0xffbcb7b7).withOpacity(0.25), // 그림자 색상
                      ),
                      child: Text(
                        '(인증 사진 첨부)',
                        style: textTheme().displaySmall,
                      ),
                    ),
                    const Expanded(
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
                    widget.onMissionClick(widget.index);
                    onClickCertification(context, widget.mission["mission_name"]);
                  },
                  child: widget.mission["checked"]
                      ? Image.asset(
                    ImageAssets.checkedOwn,
                    width: 24,
                    height: 24,
                  )
                      : Image.asset(
                    ImageAssets.uncheckedOwn,
                    width: 24,
                    height: 24,
                  ),
                ),
                IntrinsicWidth(
                  child: Text(
                    widget.mission["mission_name"],
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Image.asset(ImageAssets.uncheckedOpposite),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 5.0),
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
          ),
        ],
      ),
    );
  }
}
