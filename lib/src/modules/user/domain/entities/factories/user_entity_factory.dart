import 'package:tdd_demo/src/core/essentials/fake_factory.dart';
import 'package:tdd_demo/src/modules/user/domain/entities/user_entity.dart';

class UserEntityFactory extends ModelFactory<UserEntity> {
  @override
  UserEntity generateFake() {
    return UserEntity(
      id: faker.guid.toString(),
      name: faker.person.name(),
      image: faker.image.image(),
      email: faker.internet.email(),
    );
  }

  @override
  List<UserEntity> generateFakeList({int length = 10}) {
    return List.generate(length, (index) => generateFake());
  }
}
