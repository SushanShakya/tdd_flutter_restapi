// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:tdd_demo/src/core/errors/server_error.dart';

import 'package:tdd_demo/src/modules/user/data/models/param/create_user_param.dart';
import 'package:tdd_demo/src/modules/user/data/repo/interface/users_repo.dart';
import 'package:tdd_demo/src/modules/user/domain/entities/user_entity.dart';

class ApiUsersRepo extends UsersRepo {
  final Dio dio;

  ApiUsersRepo({required this.dio});

  @override
  Future<void> createUser(CreateUserParam user) async {
    try {
      await dio.post('/api/users', data: user.toMap());
    } catch (e) {
      throw const ServerError('err');
    }
  }

  @override
  Future<List<UserEntity>> fetchUsers() async {
    try {
      var res = await dio.get('/api/users');
      var data = res.data['data'] as List;
      return List<UserEntity>.from(data.map((e) => UserEntity.fromResponse(e)));
    } catch (e) {
      throw const ServerError('Error');
    }
  }
}
