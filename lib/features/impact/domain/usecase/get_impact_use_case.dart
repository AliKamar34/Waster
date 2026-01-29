import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/usecases/use_cases.dart';
import 'package:waster/features/impact/data/models/impact_model.dart';
import 'package:waster/features/impact/domain/repo/impact_repo.dart';

class GetImpactUseCase {
  final ImpactRepo impactRepo;

  const GetImpactUseCase({required this.impactRepo});

  Future<Either<Failure, ImpactModel>> call(NoParams params) async {
    return await impactRepo.getImpactStats();
  }
}
