class UserModel {
  String userId;
  String name;
  String email;
  String photo;

  UserModel(
      {required this.userId,
      required this.name,
      required this.email,
      required this.photo});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      photo: json['photo'],
    );
  }
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'email': email,
        'photo': photo,
      };
}
