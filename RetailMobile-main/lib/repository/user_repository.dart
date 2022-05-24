import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tecxlabs_trading_app/common/data/models/forgot_password_response.dart';
import 'package:tecxlabs_trading_app/common/data/models/login_response.dart';
import 'package:tecxlabs_trading_app/common/data/models/mpin_response.dart';

class UserRepositories {
  static String mainUrl = 'https://uathsauth.hypertrade.in';
  var loginUrl = '$mainUrl/api/login';
  var mpinUrl = '$mainUrl/api/mpinlogin';
  var forgotPasswordUrl= '$mainUrl/api/frgtpwd';

  final FlutterSecureStorage storage = FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<LoginResponse> login(
      String uid,
      String pwd,
      String brokerId,
      String deviceInfo,
      String source,
      String deviceName,
      String buildNumber) async {
        
    Response response = await _dio.post(loginUrl, data: {
      "uid": uid,
      "pwd": pwd,
      "brokerId":brokerId,
      "deviceInfo":deviceInfo,
      "source":source,
      "deviceName":deviceName,
      "buildNumber":buildNumber,
    });
    if(response.statusCode==200)
    {
      print("${response.data['code']}:${response.data.toString()}");      
      return LoginResponse.fromJson(response.data);
      //return response.data['token'];

    } else {
      print("${response.data['code']}:${response.data['message']}");
      throw Exception();

    }

  }

  Future<ForgotPasswordResponse> forgotPassword(
      String uid,
      String mobileNumber,
      String emailId,
      String pan,
      String brokerId) async {
    Response response = await _dio.post(forgotPasswordUrl, data: {
      "uid": uid,
      "mobileNo": mobileNumber,
      "emailId":emailId,
      "pan":pan,
      "brokerId":brokerId,
    });
    if(response.statusCode==200){
      print("${response.data['code']}:${response.data.toString()}");
      return ForgotPasswordResponse.fromJson(response.data);
      //return response.data['token'];
    } else {
      print("${response.data['code']}:${response.data['message']}");
      throw Exception();

    }

  }

  Future<MpinResponse> mpin(
      String uid,
      String mpin,
      String devicempinkey,
      String brokerId,
      String deviceInfo,
      String source,
      String deviceName,
      String buildNumber
      ) async {
    Response response = await _dio.post(mpinUrl, data: {
      "uid": uid,
      "mpin": mpin,
      "brokerId":brokerId,
      "devicempinkey":devicempinkey,
      "deviceInfo":deviceInfo,
      "source":source,
      "deviceName":'',
      "buildNumber":'',
    });
    if(response.statusCode==200){
      print("${response.data['code']}:${response.data.toString()}");      
      return MpinResponse.fromJson(response.data);
      //return response.data['sessionKey'];

    } else {
      print("${response.data['code']}:${response.data['message']}");
      throw Exception();

    }

  }
}
