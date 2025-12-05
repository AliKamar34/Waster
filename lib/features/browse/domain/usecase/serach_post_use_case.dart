import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/browse/domain/repo/browse_repo.dart';

class SerachPostParams extends Equatable {
  final String query;
  final String category;
  final int pageNum;
  final int pageSize;

  const SerachPostParams({
    required this.query,
    required this.category,
    required this.pageNum,
    this.pageSize = 10,
  });

  @override
  List<Object> get props => [query, category, pageNum, pageSize];
}

class SerachPostUseCase {
  final BrowseRepo browseRepo;

  const SerachPostUseCase({required this.browseRepo});

  Future<Either<Failure, PaginatedResponse<PostModel>>> call(
    SerachPostParams params,
  ) async {
    return await browseRepo.serachPosts(
      query: params.query,
      category: params.category,
      pageNum: params.pageNum,
      pageSize: params.pageSize,
    );
  }
}
