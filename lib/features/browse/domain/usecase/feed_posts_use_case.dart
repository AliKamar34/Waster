import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/browse/domain/repo/browse_repo.dart';

class FeedPostsParams extends Equatable {
  final String category;
  final int pageNum;
  final int pageSize;

  const FeedPostsParams({
    required this.category,
    required this.pageNum,
    this.pageSize = 10,
  });

  @override
  List<Object?> get props => [category, pageNum, pageSize];
}

class FeedPostsUseCase {
  final BrowseRepo browseRepo;

  const FeedPostsUseCase({required this.browseRepo});

  Future<Either<Failure, PaginatedResponse<PostModel>>> call(
    FeedPostsParams params,
  ) async {
    return await browseRepo.getFeedPosts(
      category: params.category,
      pageNum: params.pageNum,
      pageSize: params.pageSize,
    );
  }
}
