class UserModel {
  String? id;
  String? email;
  String? phone;
  String? userName;

  UserModel({this.id, this.email, this.phone, this.userName});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
    id: json['id'],
    phone: json['phone'],
    email: json['email'],
    userName: json['userName'],
  );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "phone": phone,
      "email": email,
      "userName": userName,
    };
  }
}
