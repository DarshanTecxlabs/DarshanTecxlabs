// interface which must be implemented by user/client-app
abstract class HSFeedListener {
  void response(int stCode, String msg, int responseType,
      [dynamic sub, dynamic data]);

  void scripData(String? key, String? exchng, String? token,
      List<int?> fieldIndices, List<int?> fieldValues);

  void depthData(String? key, String? exchng, String? token,
      List<int?> fieldIndices, List<int?> fieldValues);

  void indexData(String? key, String? exchng, String? token,
      List<int?> fieldIndices, List<int?> fieldValues);
}
