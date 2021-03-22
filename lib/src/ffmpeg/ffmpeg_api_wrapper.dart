import 'dart:async';

import 'package:flutter_ffmpeg/ffmpeg_execution.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_ffmpeg/media_information.dart';

class FFmpegApiWrapper {
  static FFmpegApiWrapper? _instance;

  static FFmpegApiWrapper get instance {
    if (_instance == null) {
      _instance = FFmpegApiWrapper._();
    }
    return _instance!;
  }

  FFmpegApiWrapper._();

  // FlutterFFmpegConfig构造器内部涉及部分配置功能，必须确保被调用
  final _ffconfig = FlutterFFmpegConfig();
  final _ffmpeg = FlutterFFmpeg();
  final _ffprobe = FlutterFFprobe();

  Future<void> ffmpegCancel() async {
    return await _ffmpeg.cancel();
  }

  Future<void> ffmpegCancelExecution(int executionId) async {
    return await _ffmpeg.cancelExecution(executionId);
  }

  Future<int> ffmpegExecute(String command) async {
    return await _ffmpeg.execute(command);
  }

  Future<int> ffmpegExecuteWithArguments(List<String> arguments) async {
    return await _ffmpeg.executeWithArguments(arguments);
  }

  Future<int> ffmpegExecuteAsync(String command, ExecuteCallback executeCallback) async {
    return await _ffmpeg.executeAsync(command, executeCallback);
  }

  Future<int> ffmpegExecuteAsyncWithArguments(List<String> arguments, ExecuteCallback executeCallback) async {
    return await _ffmpeg.executeAsyncWithArguments(arguments, executeCallback);
  }

  Future<List<FFmpegExecution>> ffmpegListExecutions() async {
    return await _ffmpeg.listExecutions();
  }

  List<String>? ffmpegParseArguments(command) {
    return FlutterFFmpeg.parseArguments(command);
  }

  Future<int> ffprobeExecute(String command) async {
    return await _ffprobe.execute(command);
  }

  Future<int> ffprobeExecuteWithArguments(List arguments) async {
    return await _ffprobe.executeWithArguments(arguments);
  }

  Future<MediaInformation> ffprobeGetMediaInformation(String path) async {
    return await _ffprobe.getMediaInformation(path);
  }

  Future<String> ffconfigGetFFmpegVersion() async {
    return await _ffconfig.getFFmpegVersion();
  }

  Future<String> ffconfigGetPackageName() async {
    return await _ffconfig.getPackageName();
  }

  Future<String> ffconfigGetPlatform() async {
    return await _ffconfig.getPlatform();
  }
}
