// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bmi_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(heightProvider);
    final weight = ref.watch(weightProvider);
    final bmi = ref.watch(bmiProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Height (m)',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ref.read(heightProvider.notifier).state =
                    double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ref.read(weightProvider.notifier).state =
                    double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            Text(
              'Your BMI: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
