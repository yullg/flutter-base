import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../helper/datetime_helper.dart';
import 'user_profile_picture_widget.dart';

class CommentModel {
  final String id;
  final String? pid;
  final String userId;
  final String? userNickname;
  final String? userProfilePicture;
  final String? content;
  final DateTime time;

  CommentModel? _parent;
  final List<CommentModel> _children = [];

  CommentModel({required this.id, this.pid, required this.userId, this.userNickname, this.userProfilePicture, this.content, required this.time});
}

class CommentListWidget extends StatelessWidget {
  final List<CommentModel> _comments = [];
  final ValueChanged<CommentModel>? onCommentPressed;
  final ValueChanged<CommentModel>? onCommentLongPressed;
  final ValueChanged<CommentModel>? onCommentMenuPressed;
  final ValueChanged<CommentModel>? onCommentUserPressed;
  final ValueChanged<CommentModel>? onCommentParentUserPressed;

  CommentListWidget(List<CommentModel> comments,
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
  Widget build(BuildContext context) => ListView.builder(
        itemCount: _comments.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _commentToWidget(context, _comments[index], onCommentPressed, onCommentLongPressed, onCommentMenuPressed, onCommentUserPressed,
                  onCommentParentUserPressed),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: _SubCommentList(_comments[index]._children,
                    onCommentPressed: onCommentPressed,
                    onCommentLongPressed: onCommentLongPressed,
                    onCommentMenuPressed: onCommentMenuPressed,
                    onCommentUserPressed: onCommentUserPressed,
                    onCommentParentUserPressed: onCommentParentUserPressed),
              ),
            ],
          ),
        ),
      );
}

class CommentSliverListWidget extends StatelessWidget {
  final List<CommentModel> _comments = [];
  final ValueChanged<CommentModel>? onCommentPressed;
  final ValueChanged<CommentModel>? onCommentLongPressed;
  final ValueChanged<CommentModel>? onCommentMenuPressed;
  final ValueChanged<CommentModel>? onCommentUserPressed;
  final ValueChanged<CommentModel>? onCommentParentUserPressed;

  CommentSliverListWidget(List<CommentModel> comments,
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
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _commentToWidget(context, _comments[index], onCommentPressed, onCommentLongPressed, onCommentMenuPressed, onCommentUserPressed,
                    onCommentParentUserPressed),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: _SubCommentList(_comments[index]._children,
                      onCommentPressed: onCommentPressed,
                      onCommentLongPressed: onCommentLongPressed,
                      onCommentMenuPressed: onCommentMenuPressed,
                      onCommentUserPressed: onCommentUserPressed,
                      onCommentParentUserPressed: onCommentParentUserPressed),
                ),
              ],
            ),
          ),
          childCount: _comments.length,
        ),
      );
}

class _SubCommentList extends StatefulWidget {
  final List<CommentModel> comments;
  final ValueChanged<CommentModel>? onCommentPressed;
  final ValueChanged<CommentModel>? onCommentLongPressed;
  final ValueChanged<CommentModel>? onCommentMenuPressed;
  final ValueChanged<CommentModel>? onCommentUserPressed;
  final ValueChanged<CommentModel>? onCommentParentUserPressed;

  _SubCommentList(this.comments,
      {Key? key,
      this.onCommentPressed,
      this.onCommentLongPressed,
      this.onCommentMenuPressed,
      this.onCommentUserPressed,
      this.onCommentParentUserPressed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SubCommentListState();
}

class _SubCommentListState extends State<_SubCommentList> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...(showAll ? widget.comments : widget.comments.take(3)).map((comment) => Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade100)),
                ),
                child: _commentToWidget(context, comment, widget.onCommentPressed, widget.onCommentLongPressed, widget.onCommentMenuPressed,
                    widget.onCommentUserPressed, widget.onCommentParentUserPressed),
              )),
          if (showAll == false && widget.comments.length > 3)
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey.shade100)),
                  ),
                  child: Text("展开更多${widget.comments.length - 3}条评论", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                onTap: () {
                  setState(() => showAll = true);
                },
              ),
            ),
        ],
      );
}

void _fillChildren(CommentModel parent, List<CommentModel> comments, List<CommentModel> children) {
  for (CommentModel comment in comments) {
    if (comment.pid == parent.id) {
      comment._parent = parent;
      children.add(comment);
      _fillChildren(comment, comments, children);
    }
  }
}

Widget _commentToWidget(
        BuildContext context,
        CommentModel comment,
        ValueChanged<CommentModel>? onCommentPressed,
        ValueChanged<CommentModel>? onCommentLongPressed,
        ValueChanged<CommentModel>? onCommentMenuPressed,
        ValueChanged<CommentModel>? onCommentUserPressed,
        ValueChanged<CommentModel>? onCommentParentUserPressed) =>
    InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkResponse(
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: UserProfilePictureWidget(comment.userProfilePicture, diameter: 30),
            ),
            onTap: onCommentUserPressed == null ? null : () => onCommentUserPressed(comment),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(comment.userNickname ?? "", style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                          ),
                          onTap: onCommentUserPressed == null ? null : () => onCommentUserPressed(comment),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(DateTimeHelper.smartFormat(comment.time) ?? "", style: TextStyle(color: Colors.grey)),
                    ),
                    if (onCommentMenuPressed != null)
                      Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.more_horiz, color: Colors.grey),
                          ),
                          onTap: () => onCommentMenuPressed(comment),
                        ),
                      ),
                  ],
                ),
                Builder(
                  builder: (context) {
                    if (comment.content == null) {
                      return Container(
                        color: Colors.grey.shade100,
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text("该条评论已被删除", style: TextStyle(color: Colors.grey)),
                      );
                    } else {
                      if (comment._parent == null) {
                        return Text(comment.content ?? "");
                      } else {
                        return Text.rich(
                          TextSpan(children: [
                            TextSpan(text: "回复@"),
                            TextSpan(
                              text: comment._parent?.userNickname ?? "",
                              style: TextStyle(color: Theme.of(context).primaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = onCommentParentUserPressed == null ? null : () => onCommentParentUserPressed(comment),
                            ),
                            TextSpan(text: "：${comment.content ?? ''}"),
                          ]),
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
      onTap: onCommentPressed == null ? null : () => onCommentPressed(comment),
      onLongPress: onCommentLongPressed == null ? null : () => onCommentLongPressed(comment),
    );
