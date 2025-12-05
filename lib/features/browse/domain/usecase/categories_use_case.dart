import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/usecases/use_cases.dart';
import 'package:waster/features/browse/data/models/category_model.dart';
import 'package:waster/features/browse/domain/repo/browse_repo.dart';

class CategoriesUseCase {
  final BrowseRepo browseRepo;

  const CategoriesUseCase({required this.browseRepo});

  Future<Either<Failure, CategoryResponseModel>> call(NoParams params) async {
    return await browseRepo.getCategories();
  }
}
