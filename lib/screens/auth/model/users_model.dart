class UsersModel {
  final int id;
  final String username;
  final String email;
  final String password;

  UsersModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}
