import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/post/domain/repo/post_repo.dart';

class DeleteBookMarkParams extends Equatable {
  final String id;

  const DeleteBookMarkParams({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteBookMarkUseCase {
  final PostRepo postRepo;

  const DeleteBookMarkUseCase({required this.postRepo});

  Future<Either<Failure, void>> call(DeleteBookMarkParams params) {
    return postRepo.deleteBookMarkPost(id: params.id);
  }
}
