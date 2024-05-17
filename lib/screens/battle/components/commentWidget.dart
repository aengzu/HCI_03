import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hci_03/constants/image_assets.dart';

class CommentWidget extends StatelessWidget {
  final Map comment;
  final Function(int) onClickComment;
  final int index;

  const CommentWidget(
      {super.key,
      required this.comment,
      required this.onClickComment,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                onClickComment(index);
              },
              child: comment["checked"]
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
          const SizedBox(
            width: 8.0,
          ),
          Flexible(
            child: Text(comment["comment"],
                softWrap: true,
                overflow: TextOverflow.visible,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
