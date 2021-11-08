import 'package:flutter/material.dart';

import '../widgets/metrics.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _label = 'Upperbody';
  String _weight = '45';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tonal Challenge'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Metrics(_label, _weight),
            ),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              setState(() {
                _label = value;
              });
            },
            initialValue: _label,
            decoration: const InputDecoration(
              labelText: 'Label',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            onChanged: (value) {
              // Set weight label to an empty string if it isn't a valid weight
              final weight = _getWeightFromString(value)?.toString() ?? '';

              setState(() {
                _weight = weight;
              });
            },
            validator: (value) {
              if (_getWeightFromString(value) == null) {
                return 'Please enter a number between 0 and 350';
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: _weight,
            decoration: const InputDecoration(
              labelText: 'Weight',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  /// Validates that the string provided is a number between minWeightNum and
  /// maxWeightNum.
  ///
  /// Returns:
  ///   Weight number if it is valid or null if it is not.
  int? _getWeightFromString(String? value) {
    if (value == null) return null;

    final num = int.tryParse(value);

    if (num == null || num < minWeightNum || num > maxWeightNum) return null;

    return num;
  }
}
