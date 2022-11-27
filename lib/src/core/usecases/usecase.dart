import 'package:equatable/equatable.dart';

abstract class UseCase<R, T> {
  R call(T param);
}

abstract class AsyncUseCase<R, T> {
  Future<R> call(T param);
}

class NoParam extends Equatable {
  @override
  List<Object?> get props => [];
}
