import 'package:flutter/material.dart';
import 'package:logistics/src/login/controllers/login_controller.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({
    super.key,
    required this.loginController,
    required this.formKey,
  });

  final LoginController loginController;
  final GlobalKey<FormState> formKey;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _loading = false;

  Future<void> _processTask() async {
    setState(() {
      _loading = true;
    });

    widget.loginController.login(context);
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: _loading
          ? () => {}
          : () async {
              if (widget.formKey.currentState!.validate()) {
                _processTask();
              }
            },
      child:
          _loading ? const CircularProgressIndicator() : const Text('Submit'),
    );
  }
}
