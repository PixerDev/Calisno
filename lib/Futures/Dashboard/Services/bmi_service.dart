class BmiService {
  double calculateBmi({required double weight, required double height}) {
    if (height <= -1) {
      throw ArgumentError('مقدار وزن صحیح نیست');
    }
    var mHeight = height / 100;
    var bmi = weight / (mHeight * mHeight);
    return bmi;
  }

  String getBmiCategory(double bmi) {
    if (bmi < 18.5) {
      return 'کمبود وزن';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'وزن طبیعی';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'اضافه وزن';
    } else {
      return 'چاقی';
    }
  }

  String bestwight({required double weight, required double height}) {
    var mHeight = height / 100;
    double minHeightRange = 18.5 * (mHeight * mHeight);
    double maxHeightRange = 24.9 * (mHeight * mHeight);

    return 'وزن سالم: ${minHeightRange.toStringAsFixed(1)} تا ${maxHeightRange.toStringAsFixed(1)}کیلوگرم';
  }
}
