import 'package:flutter_sport_app_1/Core/utils/constants.dart';
import 'package:flutter_sport_app_1/Futures/Ai/Models/chat_model.dart';
import 'package:flutter_sport_app_1/Futures/Ai/Services/translation_service.dart.dart';

import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:hive/hive.dart';

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;
  final chatBox = Hive.box('chatBox');
  final TranslationService translationService = TranslationService();
  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  void loadMessages() {
    // Clear the existing messages
    messages.clear();

    // Load messages from the Hive box
    messages.addAll(chatBox.values.cast<ChatMessage>().toList());
  }

  Future<void> addMessage(String message, bool isUser) async {
    var chatMessage = ChatMessage(message: message, isUser: isUser);
    await chatBox.add(chatMessage);
    messages.add(chatMessage);

    if (isUser) {
      getAIResponse(message);
    }
  }

  Future<void> getAIResponse(String userMessage) async {
    final userMessageFa =
        await translationService.translateToEnglish(userMessage);
    final aiModel =
        GenerativeModel(model: 'gemini-pro', apiKey: Constants.apiKey);
    final content = [Content.text(userMessageFa)];
    final response = await aiModel.generateContent(content);
    final responseFa = await translationService
        .translateToPersian(response.text ?? 'خطا ناشناخته');

    await addMessage(responseFa, false);
  }

  void clearData() {
    messages.clear();
    chatBox.clear();
  }
}
