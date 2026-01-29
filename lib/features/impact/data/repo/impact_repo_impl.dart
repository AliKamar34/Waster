import 'package:dartz/dartz.dart';
import 'package:waster/core/data/base_repository.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/impact/data/datasource/impact_remote_data_source.dart';
import 'package:waster/features/impact/data/models/impact_model.dart';
import 'package:waster/features/impact/domain/repo/impact_repo.dart';

class ImpactRepoImpl extends BaseRepository implements ImpactRepo {
  final ImpactRemoteDataSource impactRemoteDataSource;

  ImpactRepoImpl({required this.impactRemoteDataSource});
  @override
  Future<Either<Failure, ImpactModel>> getImpactStats() async {
    return execute(() => impactRemoteDataSource.getImpactStats());
  }
}
