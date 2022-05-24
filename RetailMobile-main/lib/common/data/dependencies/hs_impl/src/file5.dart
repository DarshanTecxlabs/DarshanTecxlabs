import 'package:web_socket_channel/status.dart' as closeStatus;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'file11.dart';
import 'file4.dart';
import 'file3.dart';
import 'file2.dart';
import 'file6.dart';
import 'file7.dart';

class Class6 {
  String _cv1;
  WebSocketChannel? cv2;
  bool _cv3 = false, _cv4 = false;
  Class5? _cv5;
  HSFeedListener _cv6;
  var cv7 = new Map();
  ConnectionStatus status = ConnectionStatus.DISCONNECTED;

  Class6(this._cv1, this._cv6);

  void f1(String av1, String av2, String? av3, int av4) {
    cv2 = WebSocketChannel.connect(Uri.parse(_cv1));
    _cv5 = new Class5(_cv6, this, av4);
    cv2!.stream.listen(_cv5!.f1, onDone: _f5, onError: _f6);
    var lv1 = Class4.f7(av1, av2, av3);
    _f19(lv1);
  }

  void f2(String av1, int av2) {
    cv2 = WebSocketChannel.connect(Uri.parse(_cv1));
    _cv5 = new Class5(_cv6, this, av2);
    cv2!.stream.listen(_cv5!.f1, onDone: _f5, onError: _f6);
    var lv1 = Class4.f1(av1);
    _f19(lv1);
  }

  void f3([bool av1 = false]) {
    status = ConnectionStatus.DISCONNECTED;
    _cv3 = av1;
    _cv4 = !av1;
    cv2?.sink.close(closeStatus.normalClosure);
    _f4();
  }

  void _f4() {
    _cv5?.cv5.clear();
  }

  void _f5() {
    status = ConnectionStatus.DISCONNECTED;
    if (_cv4) {
      _cv4 = false;
      cv2 = null;
    } else if (_cv3) {
      _cv6.response(200, "Connection closed successfully", Response.CLOSE);
      _cv3 = false;
      cv2 = null;
    } else if (cv2 != null) {
      if (cv2!.closeCode == null) {
        _cv6.response(
            11003, "Unable to connect to the server", Response.CONNECTION);
      } else {
        switch (cv2!.closeCode) {
          case closeStatus.normalClosure:
            _cv6.response(
                200, "Connection closed successfully", Response.CLOSE);
            break;
          default:
            _cv6.response(
                11006, "Connection closed abnormally", Response.CLOSE);
            break;
        }
        cv2 = null;
      }
    }
  }

  void _f6(av1, StackTrace av2) {}

  void f7(List<String> av1, int av2) {
    if (_f18(av1, Response.SUBSCRIPTION)) {
      var lv1 = Class4.f2(av1, 4, "sf", av2);
      _f19(lv1);
    }
  }

  void f8(List<String> av1, int av2) {
    if (_f18(av1, Response.UNSUBSCRIPTION)) {
      var lv1 = Class4.f2(av1, 5, "sf", av2);
      _f19(lv1);
    }
  }

  void f9(List<String> av1, int av2) {
    if (_f18(av1, Response.SUBSCRIPTION)) {
      var lv1 = Class4.f2(av1, 4, "if", av2);
      _f19(lv1);
    }
  }

  void f10(List<String> av1, int av2) {
    if (_f18(av1, Response.UNSUBSCRIPTION)) {
      var lv1 = Class4.f2(av1, 5, "if", av2);
      _f19(lv1);
    }
  }

  void f11(List<String> av1, int av2) {
    if (_f18(av1, Response.SUBSCRIPTION)) {
      var lv1 = Class4.f2(av1, 4, "dp", av2);
      _f19(lv1);
    }
  }

  void f12(List<String> av1, int av2) {
    if (_f18(av1, Response.UNSUBSCRIPTION)) {
      var lv1 = Class4.f2(av1, 5, "dp", av2);
      _f19(lv1);
    }
  }

  void f13(List<int> av1) {
    var lv1 = Class4.f5(7, av1);
    _f19(lv1);
  }

  void f14(List<int> av1) {
    var lv1 = Class4.f5(8, av1);
    _f19(lv1);
  }

  void f15(List<String> av1) {
    if (_f18(av1, Response.SNAPSHOT)) {
      var lv1 = Class4.f6(av1, 9, "sf");
      _f19(lv1);
    }
  }

  void f16(List<String> av1) {
    if (_f18(av1, Response.SNAPSHOT)) {
      var lv1 = Class4.f6(av1, 9, "dp");
      _f19(lv1);
    }
  }

  void f17(List<String> av1) {
    if (_f18(av1, Response.SNAPSHOT)) {
      var lv1 = Class4.f6(av1, 9, "if");
      _f19(lv1);
    }
  }

  bool _f18(List<String> av1, int av2) {
    if (av1.length > 100) {
      _cv6.response(11035, "Maximum scrips allowed per request is 100", av2);
      return false;
    }
    return true;
  }

  void _f19(av1) {
    if (!_cv3 && cv2 != null && cv2?.sink != null)
      cv2!.sink.add(av1);
    else
      _cv6.response(
          11042,
          "Unable to send request, Connection is not available",
          Response.ERROR);
  }

  void f20(Scrip av1, int av2, int av3, int av4, int av5) {
    final RegExp lv1 =
        RegExp(r"(^(0{1}[1-9]|[12][0-9]|3[01])/(0{1}[1-9]|1[012])/20\d{2})$");
    if (!lv1.hasMatch(av1.expDate)) {
      _cv6.response(11041, "Invalid date format", Response.OPC_SUBSCRIPTION);
      return;
    }
    var lv2 = Class4.f9(av1, av2, av3, av4, av5);
    _f19(lv2);
    cv7[av1.getKey()] = av1;
  }
}
