abstract class NetworkBase {
  Future<String> get(String url, {Map<String, String> headers});
  Future<String> post(String url, dynamic body, {Map<String, String> headers});
  Future<String> put(String url, dynamic body, {Map<String, String> headers});
}
