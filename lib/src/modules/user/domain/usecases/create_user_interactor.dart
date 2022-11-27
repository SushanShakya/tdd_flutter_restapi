import 'package:tdd_demo/src/core/usecases/usecase.dart';
import 'package:tdd_demo/src/modules/user/data/models/param/create_user_param.dart';
import 'package:tdd_demo/src/modules/user/data/repo/interface/users_repo.dart';

class CreateUserInteractor extends AsyncUseCase<void, CreateUserParam> {
  final UsersRepo repo;

  CreateUserInteractor({required this.repo});

  @override
  Future<void> call(CreateUserParam param) async => repo.createUser(param);
}
