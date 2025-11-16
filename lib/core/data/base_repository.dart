import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/cache_exception.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/errors/server_exception.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> execute<T>(Future<T> Function() operation) async {
    try {
      final result = await operation();
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on CacheException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
