import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_demo/src/core/errors/server_error.dart';
import 'package:tdd_demo/src/core/usecases/usecase.dart';
import 'package:tdd_demo/src/modules/user/domain/entities/factories/user_entity_factory.dart';
import 'package:tdd_demo/src/modules/user/domain/usecases/fetch_users_interactor.dart';
import 'package:tdd_demo/src/modules/user/gui/presenters/user/user_cubit.dart';
import 'package:warped_bloc/cubit/async_cubit.dart';
import 'package:warped_bloc/states/state.dart';

import 'user_cubit_test.mocks.dart';

@GenerateMocks([FetchUsersInteractor])
void main() {
  late FetchUsersInteractor interactor;
  late UserCubit cubit;

  final fake = UserEntityFactory().generateFakeList();
  const fakeErr = ServerError('err');

  group('UserCubit', () {
    setUpAll(() {
      interactor = MockFetchUsersInteractor();
      cubit = UserCubit(interactor: interactor);
    });

    test('is a AsyncCubit', () {
      expect(cubit, isA<AsyncCubit>());
    });

    test('calls interactor when fetch()', () {
      when(interactor.call(NoParam())).thenAnswer((e) async => fake);
      cubit.fetch();
      verify(interactor.call(NoParam()));
    });

    blocTest<UserCubit, BlocState>(
      'emits [Loading, Loaded] when fetch with success',
      build: () {
        when(interactor.call(NoParam())).thenAnswer((e) async => fake);
        return cubit;
      },
      act: (bloc) => bloc.fetch(),
      expect: () => [
        LoadingState(),
        UserLoaded(data: fake),
      ],
    );

    blocTest<UserCubit, BlocState>(
      'emits [Loading, Error] when fetch and failed',
      build: () {
        when(interactor.call(NoParam())).thenThrow(fakeErr);
        return cubit;
      },
      act: (bloc) => bloc.fetch(),
      expect: () => [LoadingState(), ErrorState(message: fakeErr.message)],
    );
  });
}
