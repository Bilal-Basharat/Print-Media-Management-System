class Task {
  final String type;
  final String size;
  final String paperorient;
  final String des;
  final String email;
  final String name;
  final String contact;

  Task({
    required this.type,
    required this.size,
    required this.paperorient,
    required this.des,
    required this.email,
    required this.name,
    required this.contact,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      type: json['type'],
      size: json['size'],
      paperorient: json['paperorient'],
      des: json['des'],
      email: json['email'],
      name: json['name'],
      contact: json['contact'],
    );
  }
}
