import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mitblr_club_app/src/events/components/event_list.dart';
import 'package:mitblr_club_app/src/events/models/event_model.dart';
import 'package:mitblr_club_app/src/login/views/login_view.dart';

Future<List<Event>> fetchEvents() async {
  final String jsonString =
      await rootBundle.loadString('lib/src/events/data/event_data.json');

  return compute(parseEvents, jsonString);
}

List<Event> parseEvents(String jsonString) {
  final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();

  return parsed.map<Event>((json) => Event.fromJson(json)).toList();
}

class EventsView extends StatelessWidget {
  final List<Event>? events;

  const EventsView({Key? key, this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'lib/assets/logo.png',
          width: 160,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 80,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logging Out...')),
                );
                await Future.delayed(const Duration(seconds: 3));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginView()));
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
        child: FutureBuilder<List<Event>>(
          future: fetchEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? EventList(events: snapshot.data)
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
