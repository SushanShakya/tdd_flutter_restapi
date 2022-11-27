import 'package:tdd_demo/src/core/usecases/usecase.dart';
import 'package:tdd_demo/src/modules/user/data/repo/interface/users_repo.dart';
import 'package:tdd_demo/src/modules/user/domain/entities/user_entity.dart';

class FetchUsersInteractor extends AsyncUseCase<List<UserEntity>, NoParam> {
  final UsersRepo repo;

  FetchUsersInteractor({required this.repo});

  @override
  Future<List<UserEntity>> call(NoParam param) async {
    return await repo.fetchUsers();
  }
}
