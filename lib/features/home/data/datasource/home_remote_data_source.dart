import 'package:waster/core/errors/server_exception.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/core/networking/api_end_points.dart';
import 'package:waster/core/networking/dio_helper.dart';

abstract class HomeRemoteDataSource {
  Future<PaginatedResponse<PostModel>> getFeedPosts({
    required String category,
    required int pageNum,
    int pageSize = 10,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioHelper dioHelper;

  const HomeRemoteDataSourceImpl({required this.dioHelper});
  @override
  Future<PaginatedResponse<PostModel>> getFeedPosts({
    required String category,
    required int pageNum,
    int pageSize = 10,
  }) async {
    try {
      final response = await dioHelper.getRequest(
        endPoint: ApiEndPoints.feedPosts,
        queryParameters: {
          'category': category,
          // 'pageNumber': pageNum,
          'pageSize': pageSize,
        },
      );

      if (response.statusCode == 200) {
        return PaginatedResponse<PostModel>.fromJson(
          response.data,
          PostModel.fromJson,
        );
      }
      throw const ServerException(message: 'Failed to fetch feed posts');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
