class BMIModel {
  double calculateBMI(double weight, double height) {
    if (height <= 0) return 0;
    return weight / (height * height);
  }
}
