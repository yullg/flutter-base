import 'dart:async';

import 'ffmpeg_api_wrapper.dart';

class FFmpegSupport {
  static Future<void> imageThumbnail(String input, String output,
      {int maxWidth = 480, int maxHeight = 480, int compressionLevel = 6, int quality = 25, int? transpose}) async {
    final completer = Completer<void>();
    await FFmpegApiWrapper.instance.ffmpegExecuteAsyncWithArguments([
      "-y",
      "-i",
      input,
      "-vcodec",
      "libwebp",
      "-compression_level",
      "$compressionLevel",
      "-qscale",
      "$quality",
      "-vframes",
      "1",
      "-vf",
      "scale='min(in_w,$maxWidth):min(in_h,$maxHeight):force_original_aspect_ratio=decrease'${transpose == null ? '' : ',transpose=$transpose'}",
      output
    ], (execution) {
      if (0 == execution.returnCode) {
        completer.complete();
      } else {
        completer.completeError(Exception("[ returnCode = ${execution.returnCode} ]"));
      }
    });
    return completer.future;
  }

  static Future<void> imageCompress(String input, String output,
      {int maxWidth = 1920, int maxHeight = 1920, int compressionLevel = 6, int quality = 75, int? transpose}) async {
    final completer = Completer<void>();
    await FFmpegApiWrapper.instance.ffmpegExecuteAsyncWithArguments([
      "-y",
      "-i",
      input,
      "-vcodec",
      "libwebp",
      "-compression_level",
      "$compressionLevel",
      "-qscale",
      "$quality",
      "-vframes",
      "1",
      "-vf",
      "scale='min(in_w,$maxWidth):min(in_h,$maxHeight):force_original_aspect_ratio=decrease'${transpose == null ? '' : ',transpose=$transpose'}",
      output
    ], (execution) {
      if (0 == execution.returnCode) {
        completer.complete();
      } else {
        completer.completeError(Exception("[ returnCode = ${execution.returnCode} ]"));
      }
    });
    return completer.future;
  }

  static Future<void> videoThumbnail(String input, String output,
      {int maxWidth = 480, int maxHeight = 480, int compressionLevel = 6, int quality = 25}) async {
    final completer = Completer<void>();
    await FFmpegApiWrapper.instance.ffmpegExecuteAsyncWithArguments([
      "-y",
      "-i",
      input,
      "-vcodec",
      "libwebp",
      "-compression_level",
      "$compressionLevel",
      "-qscale",
      "$quality",
      "-vframes",
      "1",
      "-vf",
      "scale='min(in_w,$maxWidth):min(in_h,$maxHeight):force_original_aspect_ratio=decrease'",
      output
    ], (execution) {
      if (0 == execution.returnCode) {
        completer.complete();
      } else {
        completer.completeError(Exception("[ returnCode = ${execution.returnCode} ]"));
      }
    });
    return completer.future;
  }

  static Future<void> videoCompress(String input, String output,
      {int maxWidth = 1080, int maxHeight = 1080, String maxrate = "1024K", int crf = 23}) async {
    final completer = Completer<void>();
    await FFmpegApiWrapper.instance.ffmpegExecuteAsyncWithArguments([
      "-y",
      "-i",
      input,
      "-maxrate",
      maxrate,
      "-bufsize",
      maxrate,
      "-crf",
      "$crf",
      "-vf",
      "scale='min(in_w,$maxWidth):min(in_h,$maxHeight):force_original_aspect_ratio=decrease'",
      output
    ], (execution) {
      if (0 == execution.returnCode) {
        completer.complete();
      } else {
        completer.completeError(Exception("[ returnCode = ${execution.returnCode} ]"));
      }
    });
    return completer.future;
  }

  static Future<void> cancel() async {
    await FFmpegApiWrapper.instance.ffmpegCancel();
  }

  FFmpegSupport._();
}
