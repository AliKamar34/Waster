import 'package:dartz/dartz.dart';
import 'package:waster/core/data/base_repository.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/home/data/datasource/home_remote_data_source.dart';
import 'package:waster/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl extends BaseRepository implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, PaginatedResponse<PostModel>>> getFeedPosts({
    required String category,
    required int pageNum,
    int pageSize = 10,
  }) async {
    return execute(
      () => homeRemoteDataSource.getFeedPosts(
        category: category,
        pageNum: pageNum,
      ),
    );
  }
}
