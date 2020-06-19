class User {
  final String id;
  final String email;
  final String username;

  User({this.email, this.id, this.username});
  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        username = data['username'],
        email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }
}
