import 'package:shared_preferences/shared_preferences.dart';

const String source = 'Mobile';
const String brokerId = 'TECXLABS';
const String deviceInfo = 'Mobile';
const String WEB_SOCKET_URL = "uathsmkt.hypertrade.in";
const String HYPERSYNC_DISCOVERY_URL = "https://uathsdiscovery.hypertrade.in";
const String HYPERSYNC_INTERACTIVE_URL = "https://uathsint.hypertrade.in";
const String HYPERSYNC_DISCOVERY_API_KEY = "UzL0HZiHPTc1rNVr";
const String MARKETWATCH_ITEM_IMAGE_BASE_PATH =
    "http://img.tecxlabs.com.s3-website.ap-south-1.amazonaws.com/stock/";

Future<void> saveSessionValue(sessionKey) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('Sessionkey', sessionKey);
}

removeSessionValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('Sessionkey');
}

Future<String> getSessionValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = "";
  stringValue = prefs.getString('Sessionkey')!;
  return stringValue;
}
