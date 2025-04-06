import 'package:flutter/material.dart';
import 'package:projey/generated/l10n.dart';

/// Widget that allows the user to manually enter temperature and humidity data
class DataInputForm extends StatefulWidget {
  final void Function(double, double) onSubmit;

  /// Requires a callback to send the input values back to the parent
  const DataInputForm({required this.onSubmit, super.key});

  @override
  State<DataInputForm> createState() => _DataInputFormState();
}

class _DataInputFormState extends State<DataInputForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for reading user input
  final _tempController = TextEditingController();
  final _humidityController = TextEditingController();

  /// Called when the "Add" button is pressed
  void _submit() {
    if (_formKey.currentState!.validate()) {
      final temp = double.parse(_tempController.text);
      final humidity = double.parse(_humidityController.text);

      // Send data to the parent callback
      widget.onSubmit(temp, humidity);

      // Clear the inputs after successful submission
      _tempController.clear();
      _humidityController.clear();
    }
  }

  /// Dispose the controllers when the widget is destroyed
  @override
  void dispose() {
    _tempController.dispose();
    _humidityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _tempController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: t.formTemperatureLabel),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return t.formTemperatureEmpty;
              }
              final val = double.tryParse(value);
              if (val == null || val < 0 || val > 40) {
                return t.formInvalidValue;
              }
              return null;
            },
          ),
          TextFormField(
            controller: _humidityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: t.formHumidityLabel),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return t.formHumidityEmpty;
              }
              final val = double.tryParse(value);
              if (val == null || val < 0 || val > 100) {
                return t.formInvalidValue;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _submit,
            child: Text(t.formAddButton),
          ),
        ],
      ),
    );
  }
}
