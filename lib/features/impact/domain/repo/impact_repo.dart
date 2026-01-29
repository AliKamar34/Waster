import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/impact/data/models/impact_model.dart';

abstract class ImpactRepo {
  Future<Either<Failure, ImpactModel>> getImpactStats();
}
