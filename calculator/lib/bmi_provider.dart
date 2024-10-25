import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bmi_model.dart';

// Providers to handle the inputs
final heightProvider = StateProvider<double>((ref) => 0);
final weightProvider = StateProvider<double>((ref) => 0);

// Provider to handle the BMI calculation
final bmiProvider = Provider<double>((ref) {
  final weight = ref.watch(weightProvider);
  final height = ref.watch(heightProvider);
  final bmiModel = BMIModel();
  return bmiModel.calculateBMI(weight, height);
});
