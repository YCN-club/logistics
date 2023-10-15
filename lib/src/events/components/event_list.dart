import 'package:flutter/material.dart';
import 'package:mitblr_club_app/src/events/components/event_card_widget.dart';
import 'package:mitblr_club_app/src/events/models/event_model.dart';

class EventList extends StatelessWidget {
  final List<Event>? events;

  const EventList({Key? key, this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events?.length,
      itemBuilder: (context, index) {
        return EventCard(event: events![index]);
      },
    );
  }
}
