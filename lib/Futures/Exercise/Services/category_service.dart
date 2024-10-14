import 'package:flutter_sport_app_1/Futures/Exercise/Models/category_model.dart';
import 'package:flutter_sport_app_1/gen/assets.gen.dart';

class CategoryServices {
  List<CategoryModel> getCategores() {
    List<CategoryModel> categores = [
      CategoryModel(
          imagePath: Assets.images.barfix.path, title: 'انواع بارفیکس', 1),
      CategoryModel(
          imagePath: Assets.images.pushUp.path, title: 'انواع شنا و دیپ', 0),
      CategoryModel(
          imagePath: Assets.images.plank.path, title: 'تمرینات شکم', 2),
      CategoryModel(imagePath: Assets.images.squats.path, title: 'حرکات پا', 3)
    ];
    return categores;
  }
}
