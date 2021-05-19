import 'package:flutter/material.dart';

class CommentModel {
  final String id;
  final String? pid;
  final String userId;
  final String? userNickname;
  final String? userProfilePicture;
  final String? content;
  final DateTime time;

  int _level = 0;
  CommentModel? _parent;
  final List<CommentModel> _children = [];

  CommentModel({required this.id, this.pid, required this.userId, this.userNickname, this.userProfilePicture, this.content, required this.time});
}

class CommentSliverList extends StatelessWidget {
  final List<CommentModel> _comments = [];
  final ValueChanged<CommentModel>? onCommentPressed;
  final ValueChanged<CommentModel>? onCommentLongPressed;
  final ValueChanged<CommentModel>? onCommentMenuPressed;
  final ValueChanged<CommentModel>? onCommentUserPressed;
  final ValueChanged<CommentModel>? onCommentParentUserPressed;

  CommentSliverList(List<CommentModel> comments,
      {Key? key,
      this.onCommentPressed,
      this.onCommentLongPressed,
      this.onCommentMenuPressed,
      this.onCommentUserPressed,
      this.onCommentParentUserPressed})
      : super(key: key) {
    for (CommentModel comment in comments) {
      if (comment.pid == null) {
        _fillChildren(comment, comments, comment._children);
        _comments.add(comment);
      }
    }
    this._comments.sort((a, b) => a.time.compareTo(b.time));
    this._comments.forEach((comment) => comment._children.sort((a, b) => a.time.compareTo(b.time)));
  }

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ),
          childCount: _comments.length,
        ),
      );
}

void _fillChildren(CommentModel parent, List<CommentModel> comments, List<CommentModel> children) {
  for (CommentModel comment in comments) {
    if (comment.pid == parent.id) {
      comment._level = parent._level + 1;
      comment._parent = parent;
      children.add(comment);
      _fillChildren(comment, comments, children);
    }
  }
}

// Widget _commentToWidget(
//         BuildContext context,
//         CommentModel comment,
//         ValueChanged<CommentModel>? onCommentPressed,
//         ValueChanged<CommentModel>? onCommentLongPressed,
//         ValueChanged<CommentModel>? onCommentMenuPressed,
//         ValueChanged<CommentModel>? onCommentUserPressed,
//         ValueChanged<CommentModel>? onCommentParentUserPressed) =>
//     InkWell(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 5),
//             child: ProfilePictureWidget(comment.userProfilePicture, diameter: 30),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   //crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(comment.userNickname, style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
//                     ),
//                     SizedBox(width: 10),
//                     Text(DateTimeHelper.smartFormat(comment.time) ?? "", style: TextStyle(color: Colors.grey)),
//                     if (onCommentMenuClick != null)
//                       Material(
//                         type: MaterialType.transparency,
//                         child: InkWell(
//                           child: Padding(
//                             padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//                             child: Icon(Icons.more_horiz, color: Colors.grey),
//                           ),
//                           onTap: () => onCommentMenuClick(comment),
//                         ),
//                       ),
//                   ],
//                 ),
//                 Builder(
//                   builder: (context) {
//                     String? content = comment.content;
//                     if (content == null) {
//                       return Container(
//                         color: Colors.grey[100],
//                         padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//                         child: Text("该条评论已被删除", style: TextStyle(color: Colors.grey)),
//                       );
//                     } else {
//                       CommentModel? parentComment = comment._parent;
//                       if (parentComment == null || comment._level <= 1) {
//                         return Text(content);
//                       } else {
//                         return Text.rich(
//                           TextSpan(children: [
//                             TextSpan(text: "回复@"),
//                             TextSpan(
//                               text: parentComment.userNickname,
//                               style: TextStyle(color: Constant.color_primary),
//                               recognizer: TapGestureRecognizer()..onTap = () {},
//                             ),
//                             TextSpan(text: "：$content"),
//                           ]),
//                         );
//                       }
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       onTap: () => onCommentClick?.call(comment),
//     );
