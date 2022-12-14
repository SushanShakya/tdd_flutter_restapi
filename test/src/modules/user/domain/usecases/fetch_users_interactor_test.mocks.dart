// Mocks generated by Mockito 5.2.0 from annotations
// in tdd_demo/test/src/modules/user/domain/usecases/fetch_users_interactor_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:tdd_demo/src/modules/user/data/models/param/create_user_param.dart'
    as _i5;
import 'package:tdd_demo/src/modules/user/data/repo/interface/users_repo.dart'
    as _i2;
import 'package:tdd_demo/src/modules/user/domain/entities/user_entity.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [UsersRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsersRepo extends _i1.Mock implements _i2.UsersRepo {
  MockUsersRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.UserEntity>> fetchUsers() => (super.noSuchMethod(
          Invocation.method(#fetchUsers, []),
          returnValue: Future<List<_i4.UserEntity>>.value(<_i4.UserEntity>[]))
      as _i3.Future<List<_i4.UserEntity>>);
  @override
  _i3.Future<void> createUser(_i5.CreateUserParam? user) =>
      (super.noSuchMethod(Invocation.method(#createUser, [user]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}
