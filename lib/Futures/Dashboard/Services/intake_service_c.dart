class IntakeServiceC {
  int calculateProteincalorie(int muscle) {
    return ((muscle * 2.2) * 4).round();
  }

  int calculateFatcalorie(int muscle) {
    return ((muscle * 0.9) * 9).round();
  }

  int calculatecarbohydratescalorie(int calorieIntake, int fat, int protein) {
    return ((calorieIntake - protein - fat)).round();
  }
}
