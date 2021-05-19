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
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
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
