import 'package:tdd_demo/src/modules/user/data/models/param/create_user_param.dart';
import 'package:tdd_demo/src/modules/user/domain/usecases/create_user_interactor.dart';
import 'package:warped_bloc/cubit/async_cubit.dart';
import 'package:warped_bloc/states/state.dart';

part 'user_action_state.dart';

class UserActionCubit extends AsyncCubit {
  final CreateUserInteractor interactor;

  UserActionCubit({required this.interactor});

  create(CreateUserParam param) {
    handleDefaultStates(() async {
      await interactor.call(param);
      emit(const UserActionSuccess(data: 'User created successfully !'));
    });
  }
}
