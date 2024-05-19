import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:sizing/sizing.dart';

class AchievementsSection extends StatelessWidget {
  final title;

  const AchievementsSection({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGreenSection(title),
          SizedBox(height: 0.01.sh,),

        ],
      ),
    );
  }

  Widget _buildGreenSection(String title) {
    return Container(
      width: 0.9.sw,
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      color: Color(0xffe0f6e4),
      child: Text(
        title,
        style: textTheme().titleMedium,
      ),
    );
  }

  Widget _buildConentSection(String content) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      width: 0.9.sw,
      child: Text(
        content,
        style: textTheme().bodyMedium,
      ),
    );
  }
}
