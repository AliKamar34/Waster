import 'package:waster/core/errors/server_exception.dart';
import 'package:waster/core/networking/api_end_points.dart';
import 'package:waster/core/networking/dio_helper.dart';
import 'package:waster/features/impact/data/models/impact_model.dart';

abstract class ImpactRemoteDataSource {
  Future<ImpactModel> getImpactStats();
}

class ImpactRemoteDataSourceImpl implements ImpactRemoteDataSource {
  final DioHelper dioHelper;

  const ImpactRemoteDataSourceImpl({required this.dioHelper});
  @override
  Future<ImpactModel> getImpactStats() async {
    try {
      final response = await dioHelper.getRequest(
        endPoint: ApiEndPoints.dashboard,
      );

      if (response.statusCode == 200) {
        return ImpactModel.fromJson(response.data);
      }

      throw const ServerException(message: 'Failed to fetch categories');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
