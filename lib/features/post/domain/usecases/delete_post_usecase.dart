import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/post/domain/repo/post_repo.dart';

class DeletePostParams extends Equatable {
  final String id;

  const DeletePostParams({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeletePostUsecase {
  final PostRepo postRepo;

  const DeletePostUsecase({required this.postRepo});

  Future<Either<Failure, void>> call(DeletePostParams params) {
    return postRepo.deletePost(id: params.id);
  }
}
