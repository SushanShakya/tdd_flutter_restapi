import 'package:flutter/material.dart';
import 'package:tdd_demo/src/modules/user/gui/components/user_list_item.dart';

import '../../domain/entities/user_entity.dart';

class UserListingWidget extends StatelessWidget {
  final List<UserEntity> data;
  const UserListingWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      itemBuilder: (c, i) => UserListItem(data: data[i]),
      separatorBuilder: (c, i) => const SizedBox(height: 16),
    );
  }
}
