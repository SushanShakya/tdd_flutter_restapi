import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_demo/src/core/errors/server_error.dart';
import 'package:tdd_demo/src/core/usecases/usecase.dart';
import 'package:tdd_demo/src/modules/user/data/repo/interface/users_repo.dart';
import 'package:tdd_demo/src/modules/user/domain/entities/factories/user_entity_factory.dart';
import 'package:tdd_demo/src/modules/user/domain/entities/user_entity.dart';
import 'package:tdd_demo/src/modules/user/domain/usecases/fetch_users_interactor.dart';

import 'fetch_users_interactor_test.mocks.dart';

@GenerateMocks([UsersRepo])
void main() {
  late UsersRepo repo;
  late FetchUsersInteractor interactor;

  var mockError = const ServerError('Failed');

  var producer = UserEntityFactory();

  UserEntity user = producer.generateFake();
  List<UserEntity> users = producer.generateFakeList();

  group('FetchUsersInteractor', () {
    setUp(() {
      repo = MockUsersRepo();
      interactor = FetchUsersInteractor(repo: repo);
    });

    test('is a AsyncUseCase', () {
      expect(interactor, isA<AsyncUseCase>());
    });

    test('Fetch Users returns data when ok', () async {
      when(repo.fetchUsers()).thenAnswer((e) async => users);
      var data = await interactor.call(NoParam());
      verify(repo.fetchUsers());
      expect(data, users);
    });

    test('Fetch Users throws Failure when error', () async {
      when(repo.fetchUsers()).thenThrow(mockError);
      var data = interactor.call(NoParam());
      verify(repo.fetchUsers());
      expect(data, throwsA(const TypeMatcher<ServerError>()));
    });
  });
}
