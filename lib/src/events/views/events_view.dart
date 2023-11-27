import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mitblr_club_app/src/events/components/event_list.dart';
import 'package:mitblr_club_app/src/events/models/event_model.dart';
import 'package:mitblr_club_app/src/login/components/logout_dialog.dart';
import 'package:mitblr_club_app/src/login/controllers/login_controller.dart';

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
  EventsView({Key? key, this.events}) : super(key: key);

  final List<Event>? events;
  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80.0),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              title: Image.asset(
                'lib/assets/logo.png',
                width: 160,
              ),
              forceMaterialTransparency: true,
              elevation: 0.0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: IconButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LogoutDialog(
                            loginController: _loginController,
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.exit_to_app),
                  ),
                )
              ],
            ),
          ),
        ),
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
