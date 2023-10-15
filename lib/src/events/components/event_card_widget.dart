import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final Widget title;
  final Widget child;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        margin: const EdgeInsets.all(0),
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.title,
                  const Spacer(),
                  widget.child,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
