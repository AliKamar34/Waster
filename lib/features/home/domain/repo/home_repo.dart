import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, PaginatedResponse<PostModel>>> getFeedPosts({
    required String category,
    required int pageNum,
    int pageSize = 10,
  });
}
