import 'package:waster/core/errors/server_exception.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/core/networking/api_end_points.dart';
import 'package:waster/core/networking/dio_helper.dart';
import 'package:waster/features/browse/data/models/category_model.dart';

abstract class BrowseRemoteDateSource {
  Future<CategoryResponseModel> getCategories();
  Future<PaginatedResponse<PostModel>> getExpiringSoonPosts({
    required int hours,
    required int pageNum,
    int pageSize = 10,
  });
  Future<PaginatedResponse<PostModel>> serachPosts({
    required String query,
    required String category,
    required int pageNum,
    int pageSize = 10,
  });
}

class BrowseRemoteDataSourceImpl implements BrowseRemoteDateSource {
  final DioHelper dioHelper;

  const BrowseRemoteDataSourceImpl({required this.dioHelper});

  @override
  Future<CategoryResponseModel> getCategories() async {
    try {
      final response = await dioHelper.getRequest(
        endPoint: ApiEndPoints.categories,
      );

      if (response.statusCode == 200) {
        return CategoryResponseModel.fromJson(response.data);
      }

      throw const ServerException(message: 'Failed to fetch categories');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<PaginatedResponse<PostModel>> getExpiringSoonPosts({
    required int hours,
    required int pageNum,
    int pageSize = 10,
  }) async {
    try {
      final response = await dioHelper.getRequest(
        endPoint: ApiEndPoints.expiringSoon,
        queryParameters: {
          'hours': hours,
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
      throw const ServerException(
        message: 'Failed to fetch expiring soon posts',
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<PaginatedResponse<PostModel>> serachPosts({
    required String query,
    required String category,
    required int pageNum,
    int pageSize = 10,
  }) async {
    try {
      final response = await dioHelper.getRequest(
        endPoint: ApiEndPoints.searchPosts,
        queryParameters: {
          'query': query,
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
      throw const ServerException(message: 'Failed to fetch search posts');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
