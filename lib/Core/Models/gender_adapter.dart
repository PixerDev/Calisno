import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/gender_controller.dart';
import 'package:hive/hive.dart';

class GenderAdapter extends TypeAdapter<Gender> {
  @override
  final int typeId = 101; // Unique id for this TypeAdapter

  @override
  Gender read(BinaryReader reader) {
    return Gender.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, Gender obj) {
    writer.writeByte(obj.index);
  }
}
