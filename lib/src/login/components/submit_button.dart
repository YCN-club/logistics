import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({
    super.key,
  });

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: _loading ? () => {} : () {},
      child:
          _loading ? const CircularProgressIndicator() : const Text('Submit'),
    );
  }
}
