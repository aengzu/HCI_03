import 'package:flutter/material.dart';

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
                      'assets/images/checked_own.png',
                      width: 24,
                      height: 24,
                    )
                  : Image.asset(
                      'assets/images/unchecked_own.png',
                      width: 24,
                      height: 24,
                    )),
          const SizedBox(
            width: 8.0,
          ),
          IntrinsicWidth(
            child: Text(comment["comment"],
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
