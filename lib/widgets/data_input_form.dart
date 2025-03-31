import 'package:flutter/material.dart';

class DataInputForm extends StatefulWidget {
  final void Function(double, double) onSubmit;

  const DataInputForm({required this.onSubmit, super.key});

  @override
  State<DataInputForm> createState() => _DataInputFormState();
}

class _DataInputFormState extends State<DataInputForm> {
  final _formKey = GlobalKey<FormState>();
  final _tempController = TextEditingController();
  final _humidityController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final temp = double.parse(_tempController.text);
      final humidity = double.parse(_humidityController.text);
      widget.onSubmit(temp, humidity);
      _tempController.clear();
      _humidityController.clear();
    }
  }

  @override
  void dispose() {
    _tempController.dispose();
    _humidityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _tempController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Température (°C)'),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Entrez une température';
              final val = double.tryParse(value);
              if (val == null || val < 0 || val > 50) return 'Valeur invalide';
              return null;
            },
          ),
          TextFormField(
            controller: _humidityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Humidité (%)'),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Entrez une humidité';
              final val = double.tryParse(value);
              if (val == null || val < 0 || val > 100) return 'Valeur invalide';
              return null;
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _submit,
            child: Text('Ajouter'),
          )
        ],
      ),
    );
  }
}