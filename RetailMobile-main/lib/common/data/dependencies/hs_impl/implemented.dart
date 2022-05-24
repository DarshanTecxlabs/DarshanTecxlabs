import 'package:tecxlabs_trading_app/common/data/dependencies/hs_impl/hsdartlib.dart';

class FeedListener implements HSFeedListener {
  @override
  void response(int stCode, String msg, int responseType,
      [dynamic sub, dynamic data]) {
    print(
        '${DateTime.now().toLocal()}::response:: status: $stCode, msg: $msg, responseType: $responseType, Sub: $sub, Data: $data');
  }

  @override
  void scripData(String? key, String? exchng, String? token,
      List<int?> fieldIndices, List<int?> fieldValues) {
    print(
        '${DateTime.now().toLocal()}::scripData:: key: $key, exchng: $exchng, token: $token, indices: $fieldIndices, values: $fieldValues');
  }

  @override
  void depthData(String? key, String? exchng, String? token,
      List<int?> fieldIndices, List<int?> fieldValues) {
    print(
        '${DateTime.now().toLocal()}::depthData:: key: $key, exchng: $exchng, token: $token, indices: $fieldIndices, values: $fieldValues');
  }

  @override
  void indexData(String? key, String? exchng, String? token,
      List<int?> fieldIndices, List<int?> fieldValues) {
    print(
        '${DateTime.now().toLocal()}::indexData:: key: $key, exchng: $exchng, token: $token, indices: $fieldIndices, values: $fieldValues');
  }
}
