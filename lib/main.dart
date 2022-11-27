import 'package:flutter/material.dart';
import 'package:tdd_demo/src/core/dependency_injection/injector.dart';

import 'src/modules/user/gui/views/user_view.dart';

void main() {
  injectDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserView(),
    );
  }
}
