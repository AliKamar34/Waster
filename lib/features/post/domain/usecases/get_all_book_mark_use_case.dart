import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/post/domain/repo/post_repo.dart';

class GetAllBookMarkParams extends Equatable {
  final int pageNum;
  final int pageSize;

  const GetAllBookMarkParams({required this.pageNum, this.pageSize = 10});

  @override
  List<Object?> get props => [pageNum, pageSize];
}

class GetAllBookMarkUseCase {
  final PostRepo postRepo;

  const GetAllBookMarkUseCase({required this.postRepo});

  Future<Either<Failure, PaginatedResponse<PostModel>>> call(
    GetAllBookMarkParams params,
  ) {
    return postRepo.getAllUsersPosts(
      pageNum: params.pageNum,
      pageSize: params.pageSize,
    );
  }
}
