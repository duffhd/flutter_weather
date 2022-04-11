import 'package:flutter/material.dart';

class InputDialog extends StatefulWidget {
  const InputDialog({Key? key}) : super(key: key);

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final _inputController = TextEditingController();
  var _cityName = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add your city"),
      content: TextField(
          controller: _inputController, onChanged: (String input) {
        _cityName = input;
      }),
      actions: [
        TextButton(onPressed: () async {
          if (_inputController.text.isNotEmpty) {
            Navigator.pop(context, _cityName);
          }
        }, child: const Text("Search"))
      ],
    );
  }
}
