import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multi_provider/height_provider.dart';
import 'package:multi_provider/weight_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weightProvider = Provider.of<WeightProvider>(context);
    var heightProvider = Provider.of<HeightProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Weight (Kg)',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Slider(
                min: 1,
                max: 100,
                value: weightProvider.weight,
                divisions: 100,
                label: weightProvider.weight.round().toString(),
                onChanged: (value) {
                  value = value.roundToDouble();
                  weightProvider.weight = value;
                }),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Height (cm)',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Slider(
                min: 1,
                max: 200,
                value: heightProvider.height,
                divisions: 200,
                label: heightProvider.height.round().toString(),
                activeColor: Colors.pink,
                inactiveColor: Colors.pink.withOpacity(0.2),
                onChanged: (value) {
                  value = value.roundToDouble();
                  heightProvider.height = value;
                }),
            const SizedBox(
              height: 20,
            ),
            Text(
              'your BMI : \n ${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)} ',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )),
    );
  }
}
