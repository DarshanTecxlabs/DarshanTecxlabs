import 'package:tecxlabs_trading_app/common/network/base.dart';
import 'package:http/http.dart' as http;

class NetworkHandler implements NetworkBase {
  @override
  Future<String> get(String url, {Map<String, String?>? headers}) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      }
      throw Exception();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  @override
  Future<String> post(String url, body, {Map<String, String>? headers}) async {
    var response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  @override
  Future<String> put(String url, body, {Map<String, String?>? headers}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
