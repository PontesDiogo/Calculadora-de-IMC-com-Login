class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      password: map['password'],
    );
  }
}
