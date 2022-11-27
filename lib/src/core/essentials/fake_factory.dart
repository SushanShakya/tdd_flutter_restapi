import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';

abstract class ModelFactory<T> {
  Faker get faker => Faker();

  /// Creates a fake uuid.
  String createFakeUuid() {
    return const Uuid().v4();
  }

  /// Generate a single fake model.
  T generateFake();

  /// Generate fake list based on provided length.
  List<T> generateFakeList({int length = 10}) {
    return List.generate(length, (index) => generateFake());
  }
}
