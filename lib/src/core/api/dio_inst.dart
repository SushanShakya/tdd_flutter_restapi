import 'package:dio/dio.dart';
import 'package:tdd_demo/src/core/api/strings.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: ApiStrings.url,
  ),
);
