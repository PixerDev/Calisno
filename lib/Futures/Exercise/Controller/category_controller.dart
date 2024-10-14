import 'package:flutter_sport_app_1/Futures/Exercise/Models/category_model.dart';
import 'package:flutter_sport_app_1/Futures/Exercise/Services/category_service.dart';

class CategoryController {
  late CategoryServices _titleService;
  CategoryController() {
    _titleService = CategoryServices();
  }
  List<CategoryModel> get models => _titleService.getCategores();
}
