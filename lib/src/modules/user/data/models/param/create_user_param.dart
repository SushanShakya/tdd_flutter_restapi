// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CreateUserParam extends Equatable {
  final String name;
  final String job;

  const CreateUserParam({
    required this.name,
    required this.job,
  });

  @override
  List<Object?> get props => [name, job];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'job': job,
    };
  }

  factory CreateUserParam.fromMap(Map<String, dynamic> map) {
    return CreateUserParam(
      name: map['name'] as String,
      job: map['job'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateUserParam.fromJson(String source) =>
      CreateUserParam.fromMap(json.decode(source) as Map<String, dynamic>);
}
