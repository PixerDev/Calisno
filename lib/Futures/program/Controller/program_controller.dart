import 'package:flutter_sport_app_1/Futures/program/Model/program_model.dart';
import 'package:flutter_sport_app_1/Futures/program/Services/program_service.dart';

class ProgramController {
  late ProgramService _videoService;
  ProgramController() {
    _videoService = ProgramService();
  }
  List<List<List<ProgramModel>>> get models => _videoService.getprograms();
}
