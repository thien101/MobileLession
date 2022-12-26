class UserModel {
  String? id;
  String? un;
  String? pass;
  String? name;
  String? phone;
  String? email;

  UserModel({this.id, this.un, this.pass, this.name, this.phone, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      un: json['un'],
      pass: json['pass'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      id: json['id'],
    );
  }
}
