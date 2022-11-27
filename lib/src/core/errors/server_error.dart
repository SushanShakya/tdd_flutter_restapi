import 'package:warped_bloc/exceptions/failure.dart';

class ServerError extends Failure {
  const ServerError(String message) : super(message);
}
