import 'package:hive/hive.dart';

part 'chat_model.g.dart';

@HiveType(typeId: 0)
class ChatMessage extends HiveObject {
  @HiveField(0)
  final String message;
  @HiveField(1)
  final bool isUser;

  ChatMessage({required this.message, required this.isUser});
}
