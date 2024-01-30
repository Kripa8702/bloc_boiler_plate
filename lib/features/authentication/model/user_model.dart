import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String token;
  final String? gender;
  final String? image;
  final int? age;
  final String? phone;
  final String? address;
  final String? title;

  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.token,
    this.gender,
    this.image,
    this.age,
    this.phone,
    this.address,
    this.title,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        token: json['token'],
        gender: json['gender'] ?? "",
        image: json['image'] ?? "",
        age: json['age'] ?? 0,
        phone: json['phone'] ?? "",
        address: "${json['address']['address']} ${json['address']['city']}",
        title: json['company']['title'] ?? "",
      );

  factory UserModel.fromSignInResponse(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        token: json['token'],
        gender: json['gender'] ?? "",
        image: json['image'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'token': token,
        'gender': gender,
        'image': image,
        'age': age,
        'phone': phone,
        'address': address,
        'title': title,
      };

  @override
  List<Object?> get props => [id, username, email, firstName, lastName, token];
}
