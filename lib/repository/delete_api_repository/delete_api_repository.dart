import 'package:finance_app/data/network/network_api_service.dart';

class DeleteApiRepository {
  final NetworkService _networkService = NetworkService();

  /// 🔹 AUTHORIZED DELETE
  Future<dynamic> deleteApiRepositoryFunction({
    required String url,
    required String token,
  }) async {
    try {
      final response = await _networkService.deleteApi(url: url, token: token);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
