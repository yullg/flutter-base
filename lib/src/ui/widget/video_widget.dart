import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../helper/number_helper.dart';
import '../layer/toast_layer.dart';

typedef VideoPlayerControllerBuilder = VideoPlayerController Function();

class VideoWidget extends StatefulWidget {
  final VideoPlayerControllerBuilder controllerBuilder;
  final BoxDecoration backgroundDecoration;

  VideoWidget({Key? key, required this.controllerBuilder, this.backgroundDecoration = _defaultBackgroundDecoration}) : super(key: key);

  @override
  State createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = widget.controllerBuilder();
    videoPlayerController.initialize().then((value) {
      if (mounted) {
        setState(() {});
      }
    }).catchError((e, s) {
      if (mounted) {
        ToastLayer.show("视频加载失败");
      }
    });
    videoPlayerController.setLooping(true).catchError((e, s) {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: videoPlayerController,
      child: Container(
        decoration: widget.backgroundDecoration,
        child: videoPlayerController.value.isInitialized
            ? Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  VisibilityDetector(
                    key: ObjectKey(videoPlayerController),
                    onVisibilityChanged: (visibilityInfo) {
                      if (visibilityInfo.visibleFraction < 0.1) {
                        if (videoPlayerController.value.isPlaying) {
                          videoPlayerController.pause().catchError((e, s) {});
                        }
                      }
                    },
                    child: AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(videoPlayerController),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        VideoProgressIndicator(
                          videoPlayerController,
                          allowScrubbing: true,
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        ),
                        Consumer<VideoPlayerController>(
                          builder: (context, notifier, child) {
                            return Row(
                              children: <Widget>[
                                SizedBox(width: 15),
                                Builder(
                                  builder: (context) {
                                    if (notifier.value.isPlaying) {
                                      return InkResponse(
                                        child: Icon(Icons.pause, color: Colors.white),
                                        onTap: () {
                                          videoPlayerController.pause().catchError((e, s) {
                                            ToastLayer.show("操作失败");
                                          });
                                        },
                                      );
                                    } else {
                                      return InkResponse(
                                        child: Icon(Icons.play_arrow, color: Colors.white),
                                        onTap: () {
                                          videoPlayerController.play().catchError((e, s) {
                                            ToastLayer.show("操作失败");
                                          });
                                        },
                                      );
                                    }
                                  },
                                ),
                                SizedBox(width: 15),
                                Builder(
                                  builder: (context) {
                                    if ((notifier.value.volume) > 0) {
                                      return InkResponse(
                                        child: Icon(Icons.volume_up, color: Colors.white),
                                        onTap: () {
                                          videoPlayerController.setVolume(0).catchError((e, s) {
                                            ToastLayer.show("操作失败");
                                          });
                                        },
                                      );
                                    } else {
                                      return InkResponse(
                                        child: Icon(Icons.volume_off, color: Colors.white),
                                        onTap: () {
                                          notifier.setVolume(1).catchError((e, s) {
                                            ToastLayer.show("操作失败");
                                          });
                                        },
                                      );
                                    }
                                  },
                                ),
                                Expanded(
                                  child: SizedBox.shrink(),
                                ),
                                Text(
                                  "${NumberHelper.format(notifier.value.position.inMinutes, "0") ?? "0"}:${NumberHelper.format((notifier.value.position.inSeconds) % 60, "00") ?? "00"}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  " / ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "${NumberHelper.format(notifier.value.duration.inMinutes, "0") ?? "0"}:${NumberHelper.format((notifier.value.duration.inSeconds) % 60, "00") ?? "00"}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 15),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}

const BoxDecoration _defaultBackgroundDecoration = BoxDecoration(color: Colors.black);
