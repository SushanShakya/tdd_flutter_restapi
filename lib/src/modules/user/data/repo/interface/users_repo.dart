import 'package:tdd_demo/src/modules/user/data/models/param/create_user_param.dart';
import 'package:tdd_demo/src/modules/user/domain/entities/user_entity.dart';

abstract class UsersRepo {
  Future<List<UserEntity>> fetchUsers();
  Future<void> createUser(CreateUserParam user);
}
