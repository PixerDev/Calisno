import 'package:flutter_sport_app_1/Futures/Exercise/Models/video_model.dart';

class VideoServices {
  List<List<VideoModel>> getVideo() {
    List<List<VideoModel>> categores = [
      [
        VideoModel(0,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'شنای معمولی'),
        VideoModel(0,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'شنای الماسی منفی'),
        VideoModel(0,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'شنای دست باز'),
        VideoModel(0,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'دیپ معمولی'),
        VideoModel(0,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'شنای آرچر'),
      ],
      [
        VideoModel(1,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'پول آپ'),
        VideoModel(1,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'چین آپ'),
        VideoModel(1,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'پول آب منفی'),
        VideoModel(1,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'پول آپ منفی'),
        VideoModel(1,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'چین آپ منفی'),
      ],
      [
        VideoModel(2,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'کرانچ'),
        VideoModel(2,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'فلاتر کیک'),
        VideoModel(2,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'کرانچ وی اپ'),
        VideoModel(2,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'چرخش روسی'),
        VideoModel(2,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'پلانک جانبی'),
      ],
      [
        VideoModel(3,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'لانگ'),
        VideoModel(3,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'اسکات'),
        VideoModel(3,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'اسکات آپ'),
        VideoModel(3,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'استپ آپ'),
        VideoModel(3,
            videoPath:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            title: 'بیستول'),
      ]
    ];
    return categores;
  }
}
