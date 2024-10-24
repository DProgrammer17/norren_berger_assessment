import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:norrenberger_assesment/network/exceptions/ground_exception.dart';
import 'package:norrenberger_assesment/network/exceptions/object_parse_exception.dart';
import 'package:norrenberger_assesment/network/exceptions/api_exception.dart';

Either<ApiException, E> transform<E>(
    dynamic data, E Function(dynamic) transformer) {
  try {
    return Right(transformer(data));
  } on ApiException catch (e) {
    return Left(e);
  } on TypeError {
    return Left(ObjectParseException());
  } on Exception catch (e) {
    return Left(GroundException(e.toString()));
  }
}

Either<ApiException, E> transformObject<E>(
    dynamic data, E Function(Object) transformer) {
  try {
    return Right(transformer(data));
  } on ApiException catch (e) {
    return Left(e);
  } on TypeError {
    return Left(ObjectParseException());
  } on Exception catch (e) {
    return Left(GroundException(e.toString()));
  }
}

Either<ApiException, E> processData<E>(
  E Function(dynamic) transformer,
  Either<ApiException, Response?> response,
) {
  if (response.isLeft) return Left(response.left);

  final data = transform(response.right!.data, (p0) => transformer(p0));
  return data.either((left) => left, (right) => right);
}
