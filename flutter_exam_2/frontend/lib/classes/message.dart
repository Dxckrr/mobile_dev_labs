class Message {
  String emailFrom;
  String tittle;
  String body;
  dynamic date;

  Message({
    required this.emailFrom,
    required this.tittle,
    required this.body,
    required this.date,
  });
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      emailFrom: json['email_from'] ?? 0,
      tittle: json['tittle'],
      body: json['body'],
      date: json['created_at'],
    );
  }
}
