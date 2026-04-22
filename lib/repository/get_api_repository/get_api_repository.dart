import 'package:finance_app/data/network/network_api_service.dart';

class GetApiRepository {
  final NetworkService _networkService = NetworkService();

  /// 🔹 SIMPLE GET (WITH TOKEN)
  Future<dynamic> getApiRepositoryFunction({
    required String url,
    required String token,
  }) async {
    try {
      final response = await _networkService.getApi(url: url, token: token);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
