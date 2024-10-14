class IntakeServiceG {
  int calculateProtein(int muscle) {
    return (muscle * 2.2).round();
  }

  int calculateFat(int muscle) {
    return (muscle * 0.9).round();
  }

  int calculatecarbohydrates(int calorieIntake, int fat, int protein) {
    int fatCalorie = fat * 9;
    int proteinCalorie = protein * 4;
    return ((calorieIntake - proteinCalorie - fatCalorie) / 4).round();
  }

  int calculateProteincalorie(int muscle) {
    return ((muscle * 2.2) * 4).round();
  }

  int calculateFatcalorie(int muscle) {
    return ((muscle * 0.9) * 9).round();
  }

  int calculatecarbohydratescalorie(int calorieIntake, int fat, int protein) {
    int fatCalorie = fat * 9;
    int proteinCalorie = protein * 4;
    return ((calorieIntake - proteinCalorie - fatCalorie) / 4).round();
  }
}
