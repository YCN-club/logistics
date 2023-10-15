class Event {
  final String date;
  final String location;
  final String name;
  final int participants;

  Event({
    required this.date,
    required this.location,
    required this.name,
    required this.participants,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      date: json['date'] as String,
      location: json['location'] as String,
      name: json['name'] as String,
      participants: json['participants'] as int,
    );
  }
}
