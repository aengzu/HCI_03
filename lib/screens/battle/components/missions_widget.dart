import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizing/sizing.dart';
import 'package:hci_03/constants/theme.dart';

class MissionsWidget extends StatefulWidget {
  final Map<String, dynamic> mission;
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
  void onClickCertification(BuildContext context, String missionText) {
    widget.onMissionClick(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              onClickCertification(context, widget.mission["taskName"]);
            },
            child: _buildCheckIndicator(widget.mission["myCheck"]),
          ),
          SizedBox(width: 10),
          Text(
            widget.mission["taskName"],
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 10),
          _buildOpponentCheckIndicator(widget.mission["opponentCheck"]),
        ],
      ),
    );
  }

  Widget _buildCheckIndicator(bool? isChecked) {
    if (isChecked == null) {
      return Icon(Icons.radio_button_unchecked, color: Colors.grey);
    } else if (isChecked) {
      return Icon(Icons.check_circle, color: Colors.green);
    } else {
      return Icon(Icons.radio_button_unchecked, color: Colors.grey);
    }
  }

  Widget _buildOpponentCheckIndicator(bool? isChecked) {
    if (isChecked == null) {
      return Icon(Icons.radio_button_unchecked, color: Colors.grey);
    } else if (isChecked) {
      return Icon(Icons.check_circle_outline, color: Colors.red);
    } else {
      return Icon(Icons.radio_button_unchecked, color: Colors.grey);
    }
  }
}
