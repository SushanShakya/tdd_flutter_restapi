import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_demo/src/core/errors/server_error.dart';
import 'package:tdd_demo/src/modules/user/data/models/param/create_user_param.dart';
import 'package:tdd_demo/src/modules/user/data/repo/api_user_repo.dart';
import 'package:tdd_demo/src/modules/user/data/repo/interface/users_repo.dart';
import 'package:tdd_demo/src/modules/user/domain/entities/user_entity.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'api_user_repo_test.mocks.dart';

@GenerateMocks([Dio, Response])
void main() {
  late Dio dio;
  late ApiUsersRepo repo;

  var mockResponse = jsonFixture('response/fetch_users_response.json');
  var mockParam = jsonFixture('request/create_user_param.json');

  var fakeResult = (mockResponse['data'] as List)
      .map((e) => UserEntity.fromResponse(e))
      .toList();

  var response = MockResponse();

  void stubResponse(data) {
    when(response.data).thenAnswer((realInvocation) => data);
  }

  var endpoint = '/api/users';

  group('ApiUsersRepo', () {
    setUp(() {
      dio = MockDio();
      repo = ApiUsersRepo(dio: dio);
    });

    test('is a UsersRepo', () {
      expect(repo, isA<UsersRepo>());
    });

    group('fetchUsers', () {
      setUp(() {
        stubResponse(mockResponse);
        when(dio.get(endpoint)).thenAnswer((e) async => response);
      });

      test('calls dio for /api/users only once', () async {
        await repo.fetchUsers();
        verify(dio.get(endpoint));
        verifyNoMoreInteractions(dio);
      });

      test('returns formatted user entities', () async {
        var data = await repo.fetchUsers();
        expect(data, fakeResult);
      });

      test('throws Failure when something is wrong with dio', () {
        var exc = Exception();
        when(dio.get(endpoint)).thenThrow(exc);
        expect(repo.fetchUsers(), throwsA(const TypeMatcher<ServerError>()));
      });
    });

    group('createUser', () {
      var param = mockParam;
      var userParam = CreateUserParam.fromMap(param);
      setUp(() {
        when(dio.post(endpoint, data: param))
            .thenAnswer((realInvocation) async => response);
      });
      test('calls dio.post for /api/users', () {
        repo.createUser(userParam);
        verify(dio.post(endpoint, data: param)).called(1);
      });

      test('throws ServerError when something wrong with dio', () {
        when(dio.post(endpoint, data: param)).thenThrow(Exception());
        expect(repo.createUser(userParam),
            throwsA(const TypeMatcher<ServerError>()));
      });
    });
  });
}
