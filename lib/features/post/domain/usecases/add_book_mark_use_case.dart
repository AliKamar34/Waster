import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/post/domain/repo/post_repo.dart';

class AddBookMarkParams extends Equatable {
  final String id;

  const AddBookMarkParams({required this.id});

  @override
  List<Object?> get props => [id];
}

class AddBookMarkUseCase {
  final PostRepo postRepo;

  const AddBookMarkUseCase({required this.postRepo});

  Future<Either<Failure, void>> call(AddBookMarkParams params) {
    return postRepo.addBookMarkPost(id: params.id);
  }
}
