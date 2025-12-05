import 'package:dartz/dartz.dart';
import 'package:waster/core/data/base_repository.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/browse/data/datasource/browse_remote_data_source.dart';
import 'package:waster/features/browse/data/models/category_model.dart';
import 'package:waster/features/browse/domain/repo/browse_repo.dart';

class BrowseRepoImpl extends BaseRepository implements BrowseRepo {
  final BrowseRemoteDateSource browseRemoteDateSource;

  BrowseRepoImpl({required this.browseRemoteDateSource});

  @override
  Future<Either<Failure, CategoryResponseModel>> getCategories() async {
    return execute(() => browseRemoteDateSource.getCategories());
  }

  @override
  Future<Either<Failure, PaginatedResponse<PostModel>>> getExpiringSoonPosts({
    required int hours,
    required int pageNum,
    int pageSize = 10,
  }) async {
    return execute(
      () => browseRemoteDateSource.getExpiringSoonPosts(
        hours: hours,
        pageNum: pageNum,
      ),
    );
  }

  @override
  Future<Either<Failure, PaginatedResponse<PostModel>>> getFeedPosts({
    required String category,
    required int pageNum,
    int pageSize = 10,
  }) async {
    return execute(
      () => browseRemoteDateSource.getFeedPosts(
        category: category,
        pageNum: pageNum,
      ),
    );
  }

  @override
  Future<Either<Failure, PaginatedResponse<PostModel>>> serachPosts({
    required String query,
    required String category,
    required int pageNum,
    int pageSize = 10,
  }) async {
    return execute(
      () => browseRemoteDateSource.serachPosts(
        query: query,
        category: category,
        pageNum: pageNum,
      ),
    );
  }
}
