import 'package:flutter_sport_app_1/Futures/Exercise/Models/video_model.dart';

import 'package:flutter_sport_app_1/Futures/Exercise/Services/video_service.dart';

class VideoController {
  late VideoServices _videoService;
  VideoController() {
    _videoService = VideoServices();
  }
  List<List<VideoModel>> get models => _videoService.getVideo();
}
