class Voting {
  final int id;
  final String name;
  final String startDate;
  final String endDate;
  final List options;

  const Voting({required this.id, required this.name, required this.startDate, required this.endDate, required this.options});

  factory Voting.fromJson(Map<String, dynamic> json) => Voting(
        id: json["id"] as int,
        name: json['name'] as String,
        startDate: json['startDate'] as String,
        endDate: json['endDate'] as String,
        options: json['options'] as List,
      );
}
