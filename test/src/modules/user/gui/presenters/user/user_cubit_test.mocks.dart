// Mocks generated by Mockito 5.2.0 from annotations
// in tdd_demo/test/src/modules/user/gui/presenters/user/user_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:tdd_demo/src/core/usecases/usecase.dart' as _i6;
import 'package:tdd_demo/src/modules/user/data/repo/interface/users_repo.dart'
    as _i2;
import 'package:tdd_demo/src/modules/user/domain/entities/user_entity.dart'
    as _i5;
import 'package:tdd_demo/src/modules/user/domain/usecases/fetch_users_interactor.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUsersRepo_0 extends _i1.Fake implements _i2.UsersRepo {}

/// A class which mocks [FetchUsersInteractor].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchUsersInteractor extends _i1.Mock
    implements _i3.FetchUsersInteractor {
  MockFetchUsersInteractor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UsersRepo get repo => (super.noSuchMethod(Invocation.getter(#repo),
      returnValue: _FakeUsersRepo_0()) as _i2.UsersRepo);
  @override
  _i4.Future<List<_i5.UserEntity>> call(_i6.NoParam? param) =>
      (super.noSuchMethod(Invocation.method(#call, [param]),
              returnValue:
                  Future<List<_i5.UserEntity>>.value(<_i5.UserEntity>[]))
          as _i4.Future<List<_i5.UserEntity>>);
}