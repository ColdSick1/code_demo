import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

typedef ApiRequest = Future<Either<Failure, dynamic>>;

typedef StringCallback = void Function(String value);
