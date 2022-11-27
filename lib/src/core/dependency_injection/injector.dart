import 'package:get_it/get_it.dart';
import 'package:tdd_demo/src/modules/user/data/repo/api_user_repo.dart';
import 'package:tdd_demo/src/modules/user/domain/usecases/create_user_interactor.dart';
import 'package:tdd_demo/src/modules/user/domain/usecases/fetch_users_interactor.dart';
import 'package:tdd_demo/src/modules/user/gui/presenters/user/user_cubit.dart';
import 'package:tdd_demo/src/modules/user/gui/presenters/user_action/user_action_cubit.dart';

import '../api/dio_inst.dart';

final g = GetIt.I;

void injectDependencies() {
  // Repo
  g.registerLazySingleton(() => ApiUsersRepo(dio: dio));

  // UseCases
  g.registerLazySingleton(() => FetchUsersInteractor(repo: g<ApiUsersRepo>()));
  g.registerLazySingleton(() => CreateUserInteractor(repo: g<ApiUsersRepo>()));

  // Factories
  g.registerFactory(() => UserCubit(interactor: g<FetchUsersInteractor>()));
  g.registerFactory(
    () => UserActionCubit(interactor: g<CreateUserInteractor>()),
  );
}
