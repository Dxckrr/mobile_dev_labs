// enum Role {
//   auxiliar,
//   tecnicoRedes,
//   serviciosGenerales,
//   operadorLogistico,
//   contador,
//   subgerente,
//   admin,
// }

class User {
  int? id;
  String email;
  String photo;
  String fullName;
  String phoneNumber;
  String role;

  User({
    this.id,
    required this.email,
    required this.photo,
    required this.fullName,
    required this.phoneNumber,
    required this.role,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      email: json['email'],
      phoneNumber: json['phone_number'],
      fullName: json['full_name'],
      role: json['role'],
      photo: json['photo'],
    );
  }
}
