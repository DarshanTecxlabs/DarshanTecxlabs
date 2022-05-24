import 'package:tecxlabs_trading_app/common/utils/const.dart';

import '../hsdartlib.dart';

final String hsmUrl = "10.10.3.199:1542";

void main() async {
  List<String> scrips = [
    "nse_cm|1922",
    "nse_cm|11536",
    "nse_cm|22",
    "nse_cm|236",
    "nse_cm|3045",
    "nse_cm|3456",
    "nse_cm|4963",
    "nse_cm|1660",
    "nse_cm|7406",
    "nse_cm|11915"
  ];

  HSFeedListener feedListener = new HSFeedListenerImpl();
  HSConnection hsConnection = HSConnection.getInstance();
  hsConnection.connectWithXAccessToken(
      WEB_SOCKET_URL, feedListener, await getSessionValue());

  Future.delayed(Duration(seconds: 1), () {
    if (hsConnection.getStatus() == ConnectionStatus.CONNECTED)
      hsConnection.subscribeScrip(scrips, 1);
  });

  //hsConnection.subscribeOpChain(new Scrip("nse_cm", "Nifty 50", "21/03/2021"), 1535000, 4, 4, 36);
}

class HSFeedListenerImpl implements HSFeedListener {
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
