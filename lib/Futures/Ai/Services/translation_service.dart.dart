import 'package:translator/translator.dart';

class TranslationService {
  final translator = GoogleTranslator();

  Future<String> translateToEnglish(String text) async {
    var translation = await translator.translate(text, to: 'en');
    return translation.text;
  }

  Future<String> translateToPersian(String text) async {
    var translation = await translator.translate(text, to: 'fa');
    return translation.text;
  }
}
