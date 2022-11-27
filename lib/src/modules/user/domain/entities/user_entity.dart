// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final String email;

  const UserEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
  });

  factory UserEntity.fromResponse(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'].toString(),
      name: map['first_name'],
      image: map['avatar'],
      email: map['email'],
    );
  }

  @override
  List<Object?> get props => [id, name, image, email];
}
