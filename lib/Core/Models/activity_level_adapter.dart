import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/activity_controller.dart';
import 'package:hive/hive.dart';

class ActivityLevelAdapter extends TypeAdapter<ActivityLevel> {
  @override
  final int typeId = 102; // Unique id for this TypeAdapter

  @override
  ActivityLevel read(BinaryReader reader) {
    return ActivityLevel.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, ActivityLevel obj) {
    writer.writeByte(obj.index);
  }
}
