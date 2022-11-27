// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tdd_demo/src/modules/user/data/models/factories/create_user_param_factory.dart';
import 'package:warped_bloc/warped_bloc.dart';

import 'package:tdd_demo/src/modules/user/domain/entities/user_entity.dart';
import 'package:tdd_demo/src/modules/user/gui/presenters/user/user_cubit.dart';
import 'package:tdd_demo/src/modules/user/gui/presenters/user_action/user_action_cubit.dart';

import '../../../../core/dependency_injection/injector.dart';
import '../components/user_listing_widget.dart';

class UserView extends StatefulWidget {
  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late UserCubit cubit;
  late UserActionCubit actionCubit;

  @override
  void initState() {
    super.initState();
    cubit = g<UserCubit>()..fetch();
    actionCubit = g<UserActionCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get name and job from some form
          var param = CreateUserParamFactory().generateFake();
          actionCubit.create(param);
        },
        child: const Icon(Icons.add),
      ),
      body: BlocWrapper(
        bloc: actionCubit,
        listener: defaultListener(),
        child: BlocWrapper<UserCubit, BlocState>(
          bloc: cubit,
          builder: defaultBuilder<BlocState, List<UserEntity>, dynamic>(
            onData: (data) => UserListingWidget(data: data),
          ),
        ),
      ),
    );
  }
}
