import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/browse/data/models/category_model.dart';

abstract class BrowseRepo {
  Future<Either<Failure, PaginatedResponse<PostModel>>> getFeedPosts({
    required String category,
    required int pageNum,
    int pageSize = 10,
  });
  Future<Either<Failure, CategoryResponseModel>> getCategories();
  Future<Either<Failure, PaginatedResponse<PostModel>>> getExpiringSoonPosts({
    required int hours,
    required int pageNum,
    int pageSize = 10,
  });
  Future<Either<Failure, PaginatedResponse<PostModel>>> serachPosts({
    required String query,
    required String category,
    required int pageNum,
    int pageSize = 10,
  });
}
