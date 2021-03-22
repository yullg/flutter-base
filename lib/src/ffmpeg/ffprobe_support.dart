// import 'ffmpeg_api_wrapper.dart';
//
// class FFprobeSupport {
//   static Future<MediaInformation> getMediaInformation(String path) async {
//     var originalResult = await FFmpegApiWrapper.instance.ffprobeGetMediaInformation(path);
//     var mediaInformation = MediaInformation();
//     mediaInformation.duration = originalResult.getMediaProperties()["duration"];
//     if (originalResult.getStreams() != null) {
//       for (var streamsInfo in originalResult.getStreams()) {
//         if ("video" == streamsInfo.getAllProperties()["type"]) {
//           mediaInformation.width = streamsInfo.getAllProperties()["width"];
//           mediaInformation.height = streamsInfo.getAllProperties()["height"];
//           mediaInformation.bitrate = streamsInfo.getAllProperties()["bitrate"];
//           break;
//         }
//       }
//     }
//     return mediaInformation;
//   }
//
//   FFprobeSupport._();
// }
//
// class MediaInformation {
//   int width;
//   int height;
//   int bitrate;
//   int duration;
//
//   @override
//   String toString() {
//     return 'MediaInformation{width: $width, height: $height, bitrate: $bitrate, duration: $duration}';
//   }
// }
