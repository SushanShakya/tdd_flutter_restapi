import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_demo/src/core/errors/server_error.dart';
import 'package:tdd_demo/src/modules/user/data/models/factories/create_user_param_factory.dart';
import 'package:tdd_demo/src/modules/user/data/repo/interface/users_repo.dart';
import 'package:tdd_demo/src/modules/user/domain/usecases/create_user_interactor.dart';

import 'fetch_users_interactor_test.mocks.dart';

void main() {
  late UsersRepo repo;
  late CreateUserInteractor interactor;

  var param = CreateUserParamFactory().generateFake();
  var mockErr = const ServerError('err');

  setUp(() {
    repo = MockUsersRepo();
    interactor = CreateUserInteractor(repo: repo);
  });

  test('calls users repo to create user', () async {
    when(repo.createUser(param)).thenAnswer((e) async {});
    await interactor.call(param);
    verify(repo.createUser(param));
    verifyNoMoreInteractions(repo);
  });

  test('throws Failure when error occurs', () async {
    when(repo.createUser(param)).thenThrow(mockErr);
    expect(interactor.call(param), throwsA(const TypeMatcher<ServerError>()));
  });
}
