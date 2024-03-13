import 'package:flutter/material.dart';
import 'package:logistics/src/events/models/event_model.dart';
import 'package:logistics/src/login/views/login_view.dart';

class AttendView extends StatefulWidget {
  final Event? event;

  const AttendView({super.key, required this.event});

  @override
  State<AttendView> createState() => _AttendViewState();
}

class _AttendViewState extends State<AttendView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Image.asset(
          'lib/assets/logo.png',
          width: 160,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logging Out...')),
                );
                await Future.delayed(const Duration(seconds: 3));
                if (context.mounted) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()));
                }
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Form(
            key: _formKey,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: 'Registration Number',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ),
              keyboardType: TextInputType.number,
              validator: _validator,
            ),
          ),
        ),
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }
    return null;
  }
}
