class User {
  final String id;
  final String first_name;
  final String last_name;
  final String email_address;
  final String password;

  const User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email_address,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      email_address: json['email_address'],
      password: json['password'],
    );
  }
}
