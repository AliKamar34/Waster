import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/browse/domain/repo/browse_repo.dart';

class ExpiringSoonPostsParams extends Equatable {
  final int hours;
  final int pageNum;
  final int pageSize;

  const ExpiringSoonPostsParams({
    required this.hours,
    required this.pageNum,
    this.pageSize = 10,
  });

  @override
  List<Object?> get props => [hours, pageNum, pageSize];
}

class ExpiringSoonPostsUseCase {
  final BrowseRepo browseRepo;

  const ExpiringSoonPostsUseCase({required this.browseRepo});

  Future<Either<Failure, PaginatedResponse<PostModel>>> call(
    ExpiringSoonPostsParams params,
  ) async {
    return await browseRepo.getExpiringSoonPosts(
      hours: params.hours,
      pageNum: params.pageNum,
      pageSize: params.pageSize,
    );
  }
}
