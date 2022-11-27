// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tdd_demo/src/core/usecases/usecase.dart';
import 'package:warped_bloc/cubit/async_cubit.dart';
import 'package:warped_bloc/states/state.dart';

import 'package:tdd_demo/src/modules/user/domain/usecases/fetch_users_interactor.dart';

import '../../../domain/entities/user_entity.dart';

part 'user_state.dart';

class UserCubit extends AsyncCubit {
  final FetchUsersInteractor interactor;
  UserCubit({required this.interactor});

  fetch() {
    handleDefaultStates(() async {
      var data = await interactor.call(NoParam());
      emit(UserLoaded(data: data));
    });
  }
}
