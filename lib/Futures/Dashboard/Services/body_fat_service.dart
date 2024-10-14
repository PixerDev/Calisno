class BodyFatService {
  int calculateBodyFat(double bmi) {
    if (bmi < 18.5) {
      return 15;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 20;
    } else if (bmi >= 25 && bmi < 29.9) {
      return 25;
    } else {
      return 50;
    }
  }

  int muscle(int? bodyFatuser, int bodyFat, double userweight) {
    if (bodyFatuser != null) {
      return (userweight - bodyFatuser).round();
    } else {
      return (userweight - bodyFat).round();
    }
  }
}
