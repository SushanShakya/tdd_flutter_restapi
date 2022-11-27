import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_demo/src/core/errors/server_error.dart';
import 'package:tdd_demo/src/modules/user/data/models/factories/create_user_param_factory.dart';
import 'package:tdd_demo/src/modules/user/domain/usecases/create_user_interactor.dart';
import 'package:tdd_demo/src/modules/user/gui/presenters/user_action/user_action_cubit.dart';
import 'package:warped_bloc/cubit/async_cubit.dart';
import 'package:warped_bloc/states/state.dart';

import 'user_action_cubit_test.mocks.dart';

@GenerateMocks([CreateUserInteractor])
void main() {
  late CreateUserInteractor interactor;
  late UserActionCubit cubit;

  final param = CreateUserParamFactory().generateFake();
  const err = ServerError('err');

  group('UserActionCubit', () {
    setUp(() {
      interactor = MockCreateUserInteractor();
      cubit = UserActionCubit(interactor: interactor);
    });

    test('is AsyncCubit', () {
      expect(cubit, isA<AsyncCubit>());
    });

    test('create calls interactor', () async {
      when(interactor.call(param)).thenAnswer((e) async {});
      await interactor.call(param);
      verify(cubit.create(param));
    });

    blocTest<UserActionCubit, BlocState>(
      'emits [Loading, Success] when create and success',
      build: () {
        when(interactor.call(param)).thenAnswer((e) async {});
        return cubit;
      },
      act: (bloc) => bloc.create(param),
      expect: () => [
        LoadingState(),
        const UserActionSuccess(data: 'User created successfully !'),
      ],
    );
    blocTest<UserActionCubit, BlocState>(
      'emits [Loading, Error] when create and failed',
      build: () {
        when(interactor.call(param)).thenThrow(err);
        return cubit;
      },
      act: (bloc) => bloc.create(param),
      expect: () => [
        LoadingState(),
        ErrorState(message: err.message),
      ],
    );
  });
}
