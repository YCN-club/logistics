import 'package:flutter/material.dart';

import 'package:logistics/src/events/models/event_model.dart';
import 'package:logistics/src/navigation/components/sub_view_app_bar.dart';

class AttendView extends StatefulWidget {
  final Event event;

  const AttendView({super.key, required this.event});

  @override
  State<AttendView> createState() => _AttendViewState();
}

class _AttendViewState extends State<AttendView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SubViewAppBar(),
        preferredSize: Size(double.infinity, 65.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.event.name,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    widget.event.club,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
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
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    '${widget.event.participants} registrations',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
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
