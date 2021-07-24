import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../helper/datetime_helper.dart';
import 'user_profile_picture_widget.dart';

class Comment {
  final String id;
  final String? pid;
  final String userId;
  final String? userNickname;
  final String? userProfilePicture;
  final String? content;
  final DateTime time;

  Comment({required this.id, this.pid, required this.userId, this.userNickname, this.userProfilePicture, this.content, required this.time});
}

class _CommentModel {
  final Comment data;
  final Comment? parent;

  _CommentModel(this.data, this.parent);
}

List<MapEntry<_CommentModel, List<_CommentModel>>> _commentsToModels(List<Comment> comments) {
  List<MapEntry<_CommentModel, List<_CommentModel>>> result = [];
  for (var comment in comments) {
    if (comment.pid == null) {
      List<_CommentModel> children = [];
      _fillChildren(comment, comments, children);
      result.add(MapEntry(_CommentModel(comment, null), children));
    }
  }
  result.sort((a, b) => a.key.data.time.compareTo(b.key.data.time));
  result.forEach((e) => e.value.sort((a, b) => a.data.time.compareTo(b.data.time)));
  return result;
}

void _fillChildren(Comment parent, List<Comment> comments, List<_CommentModel> children) {
  for (var comment in comments) {
    if (comment.pid == parent.id) {
      children.add(_CommentModel(comment, parent));
      _fillChildren(comment, comments, children);
    }
  }
}

class CommentListWidget extends StatelessWidget {
  final List<MapEntry<_CommentModel, List<_CommentModel>>> _models;
  final ValueChanged<Comment>? onCommentPressed;
  final ValueChanged<Comment>? onCommentLongPressed;
  final ValueChanged<Comment>? onCommentMenuPressed;
  final ValueChanged<Comment>? onCommentUserPressed;
  final ValueChanged<Comment>? onCommentParentUserPressed;

  CommentListWidget(List<Comment> comments,
      {Key? key,
      this.onCommentPressed,
      this.onCommentLongPressed,
      this.onCommentMenuPressed,
      this.onCommentUserPressed,
      this.onCommentParentUserPressed})
      : _models = _commentsToModels(comments),
        super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: _models.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _modelToWidget(context, _models[index].key,
                  onCommentPressed: onCommentPressed,
                  onCommentLongPressed: onCommentLongPressed,
                  onCommentMenuPressed: onCommentMenuPressed,
                  onCommentUserPressed: onCommentUserPressed,
                  onCommentParentUserPressed: onCommentParentUserPressed),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: _SubCommentList(_models[index].value,
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
  final List<MapEntry<_CommentModel, List<_CommentModel>>> _models;
  final ValueChanged<Comment>? onCommentPressed;
  final ValueChanged<Comment>? onCommentLongPressed;
  final ValueChanged<Comment>? onCommentMenuPressed;
  final ValueChanged<Comment>? onCommentUserPressed;
  final ValueChanged<Comment>? onCommentParentUserPressed;

  CommentSliverListWidget(List<Comment> comments,
      {Key? key,
      this.onCommentPressed,
      this.onCommentLongPressed,
      this.onCommentMenuPressed,
      this.onCommentUserPressed,
      this.onCommentParentUserPressed})
      : _models = _commentsToModels(comments),
        super(key: key);

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
                _modelToWidget(context, _models[index].key,
                    onCommentPressed: onCommentPressed,
                    onCommentLongPressed: onCommentLongPressed,
                    onCommentMenuPressed: onCommentMenuPressed,
                    onCommentUserPressed: onCommentUserPressed,
                    onCommentParentUserPressed: onCommentParentUserPressed),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: _SubCommentList(_models[index].value,
                      onCommentPressed: onCommentPressed,
                      onCommentLongPressed: onCommentLongPressed,
                      onCommentMenuPressed: onCommentMenuPressed,
                      onCommentUserPressed: onCommentUserPressed,
                      onCommentParentUserPressed: onCommentParentUserPressed),
                ),
              ],
            ),
          ),
          childCount: _models.length,
        ),
      );
}

class _SubCommentList extends StatefulWidget {
  final List<_CommentModel> models;
  final ValueChanged<Comment>? onCommentPressed;
  final ValueChanged<Comment>? onCommentLongPressed;
  final ValueChanged<Comment>? onCommentMenuPressed;
  final ValueChanged<Comment>? onCommentUserPressed;
  final ValueChanged<Comment>? onCommentParentUserPressed;

  _SubCommentList(this.models,
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
          ...(showAll ? widget.models : widget.models.take(3)).map((model) => Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade100)),
                ),
                child: _modelToWidget(context, model,
                    onCommentPressed: widget.onCommentPressed,
                    onCommentLongPressed: widget.onCommentLongPressed,
                    onCommentMenuPressed: widget.onCommentMenuPressed,
                    onCommentUserPressed: widget.onCommentUserPressed,
                    onCommentParentUserPressed: widget.onCommentParentUserPressed),
              )),
          if (showAll == false && widget.models.length > 3)
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
                  child: Text("展开更多${widget.models.length - 3}条评论", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                onTap: () {
                  setState(() => showAll = true);
                },
              ),
            ),
        ],
      );
}

Widget _modelToWidget(BuildContext context, _CommentModel model,
        {ValueChanged<Comment>? onCommentPressed,
        ValueChanged<Comment>? onCommentLongPressed,
        ValueChanged<Comment>? onCommentMenuPressed,
        ValueChanged<Comment>? onCommentUserPressed,
        ValueChanged<Comment>? onCommentParentUserPressed}) =>
    InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkResponse(
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: UserProfilePictureWidget(model.data.userProfilePicture, diameter: 30),
            ),
            onTap: onCommentUserPressed == null ? null : () => onCommentUserPressed(model.data),
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
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(model.data.userNickname ?? "", style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(DateTimeHelper.smartFormat(model.data.time) ?? "", style: TextStyle(color: Colors.grey)),
                    ),
                    if (onCommentMenuPressed != null)
                      Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.more_horiz, color: Colors.grey),
                          ),
                          onTap: () => onCommentMenuPressed(model.data),
                        ),
                      ),
                  ],
                ),
                Builder(
                  builder: (context) {
                    if (model.data.content == null) {
                      return Container(
                        color: Colors.grey.shade100,
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text("该条评论已被删除", style: TextStyle(color: Colors.grey)),
                      );
                    } else if (model.parent != null) {
                      return Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "回复@"),
                          TextSpan(
                            text: model.parent?.userNickname ?? "",
                            style: TextStyle(color: Theme.of(context).primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = onCommentParentUserPressed == null ? null : () => onCommentParentUserPressed(model.data),
                          ),
                          TextSpan(text: model.data.content ?? ""),
                        ]),
                      );
                    } else {
                      return Text(model.data.content ?? "");
                    }
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
      onTap: onCommentPressed == null ? null : () => onCommentPressed(model.data),
      onLongPress: onCommentLongPressed == null ? null : () => onCommentLongPressed(model.data),
    );
