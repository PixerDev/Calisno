class WeightCountService {
  int calculateWeightControl(int tdee, double bmi) {
    if (bmi < 18.5) {
      return (tdee + 300).round();
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return (tdee).round();
    } else if (bmi >= 25 && bmi < 29.9) {
      return (tdee - 500).round();
    } else {
      return (tdee - 500).round();
    }
  }
}
