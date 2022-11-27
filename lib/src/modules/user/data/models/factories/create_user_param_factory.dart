import 'package:tdd_demo/src/core/essentials/fake_factory.dart';

import '../param/create_user_param.dart';

class CreateUserParamFactory extends ModelFactory<CreateUserParam> {
  @override
  CreateUserParam generateFake() {
    return CreateUserParam(
      name: faker.person.name(),
      job: faker.company.position(),
    );
  }
}
