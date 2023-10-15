import 'package:flutter/material.dart';
import 'package:mitblr_club_app/src/events/models/event_model.dart';

class EventCard extends StatefulWidget {
  const EventCard({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.event.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Icon(Icons.alarm, size: 18.0),
                    ),
                    Text(widget.event.date),
                    const Text(' • '),
                    const Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Icon(Icons.people, size: 18.0),
                    ),
                    Text(
                        '${widget.event.participants.toString()} registrations'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
