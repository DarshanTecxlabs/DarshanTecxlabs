import 'dart:async';
import 'dart:typed_data';

import 'file11.dart';
import 'file3.dart';
import 'file2.dart';
import 'file5.dart';
import 'file7.dart';
import 'file4.dart';
import 'file8.dart';
import 'file9.dart';

class Class5 {
  int? _cv1 = 0, _cv2, _cv3 = 0;
  late Duration _cv4;

  var cv5 = new Map();

  late HSFeedListener _cv6;
  Class6? _cv7;

  Class5(HSFeedListener av1, Class6 av2, int av3) {
    _cv7 = av2;
    _cv6 = av1;
    _cv4 = Duration(seconds: av3);
  }

  void f1(av1) {
    if (av1 is Uint8List) {
      int lv1 = 0;
      lv1 += 2;
      var lv2 = Class2.f1(av1.sublist(lv1, lv1 + 1));
      lv1 += 1;
      if (lv2 == 1) {
        int lv3 = Class2.f1(av1.sublist(lv1, lv1 + 1));
        if (lv3 >= 2) {
          lv1 += 1;
          lv1++;
          int lv4 = Class2.f1(av1.sublist(lv1, lv1 + 2));
          lv1 += 2;
          String lv5 = Class2.f2(av1.sublist(lv1, lv1 + lv4));
          lv1 += lv4;
          lv1++;
          lv4 = Class2.f1(av1.sublist(lv1, lv1 + 2));
          lv1 += 2;
          _cv1 = Class2.f1(av1.sublist(lv1, lv1 + lv4));
          if (lv5 == 'K') {
            _cv7!.status = ConnectionStatus.CONNECTED;
            if (_cv4 > Duration(seconds: 0)) {
              Timer.periodic(_cv4, (lv6) {
                if (_cv7?.cv2?.sink != null) {
                  _cv7!.cv2!.sink.add(Class4.cv1);
                } else {
                  lv6.cancel();
                }
              });
            }
            _cv6.response(200, "Connection successful", Response.CONNECTION);
          } else {
            _cv7!.f3();
            _cv6.response(
                11001,
                "Connection failed, Invalid response from server",
                Response.CONNECTION);
          }
        } else {
          _cv7!.f3();
          _cv6.response(
              11001,
              "Connection failed, Invalid response from server",
              Response.CONNECTION);
        }
      } else if (lv2 == 6) {
        if (_cv1! > 0) {
          _cv3 = _cv3! + 1;
          _cv2 = Class2.f1(av1.sublist(lv1, lv1 + 4));
          lv1 += 4;
          if (_cv3 == _cv1) {
            var lv7 = Class4.f4(_cv2!);
            _cv7?.cv2?.sink.add(lv7);
            _cv3 = 0;
          }
        }
        int lv8 = Class2.f1(av1.sublist(lv1, lv1 + 2));
        lv1 += 2;
        for (int i = 0; i < lv8; i++) {
          lv1 += 2;
          int lv9 = Class2.f1(av1.sublist(lv1, lv1 + 1));
          lv1++;
          if (lv9 == 83) {
            int lv10 = Class2.f1(av1.sublist(lv1, lv1 + 4));
            lv1 += 4;
            int lv11 = Class2.f1(av1.sublist(lv1, lv1 + 1));
            lv1++;

            String lv12 = Class2.f2(av1.sublist(lv1, lv1 + lv11));
            lv1 += lv11;

            var lv13 = new Class3(lv10, lv12);
            cv5[lv10] = lv13;

            int lv14 = Class2.f1(av1.sublist(lv1, lv1 + 1));
            lv1++;

            for (int lv15 = 0; lv15 < lv14; lv15++) {
              int lv16 = Class2.f1(av1.sublist(lv1, lv1 + 4));
              lv13.f1(lv15, lv16);
              lv1 += 4;
            }

            lv13.f2();

            lv14 = Class2.f1(av1.sublist(lv1, lv1 + 1));
            lv1++;

            for (int lv17 = 0; lv17 < lv14; lv17++) {
              lv1++;
              int lv18 = Class2.f1(av1.sublist(lv1, lv1 + 1));
              lv1++;
              lv1 += lv18;
            }

            _f3(lv13);
          } else if (lv9 == 85) {
            int lv19 = Class2.f1(av1.sublist(lv1, lv1 + 4));
            lv1 += 4;

            Class3? lv20 = cv5[lv19];
            if (lv20 == null) {
              _cv6.response(11033, "Invalid topic data", Response.ERROR);
            } else {
              int lv21 = Class2.f1(av1.sublist(lv1, lv1 + 1));
              lv1++;

              for (int lv22 = 0; lv22 < lv21; lv22++) {
                int lv23 = Class2.f1(av1.sublist(lv1, lv1 + 4));
                lv20.f1(lv22, lv23);
                lv1 += 4;
              }

              _f3(lv20);
            }
          } else {}
        }
      } else if (lv2 == 4 || lv2 == 5) {
        if (_f2(av1, lv1)) {
          if (lv2 == 4)
            _cv6.response(200, "Subscribe successful", Response.SUBSCRIPTION);
          else
            _cv6.response(
                200, "Unsubscribe successful", Response.UNSUBSCRIPTION);
        } else {
          if (lv2 == 4)
            _cv6.response(11011, "Subscribe failed", Response.SUBSCRIPTION);
          else
            _cv6.response(11012, "Unsubscribe failed", Response.UNSUBSCRIPTION);
        }
      } else if (lv2 == 9) {
        if (_f2(av1, lv1))
          _cv6.response(200, "Snapshot successful", Response.SNAPSHOT);
        else
          _cv6.response(11013, "Snapshot failed", Response.SNAPSHOT);
      } else if (lv2 == 7) {
        if (_f2(av1, lv1))
          _cv6.response(200, "Pause successful", Response.CHANNEL);
        else
          _cv6.response(11031, "Pause failed", Response.CHANNEL);
      } else if (lv2 == 8) {
        if (_f2(av1, lv1))
          _cv6.response(200, "Resume successful", Response.CHANNEL);
        else
          _cv6.response(11032, "Resume failed", Response.CHANNEL);
      } else if (lv2 == 10) {
        if (_f2(av1, lv1)) {
          lv1 += 5;
          lv1++;
          int lv25 = Class2.f1(av1.sublist(lv1, lv1 + 2));
          lv1 += 2;
          String lv26 = Class2.f2(av1.sublist(lv1, lv1 + lv25));
          lv1 += lv25;
          lv1++;
          lv25 = Class2.f1(av1.sublist(lv1, lv1 + 2));
          lv1 += 2;
          String lv27 = Class2.f2(av1.sublist(lv1, lv1 + lv25));
          lv1 += lv25;
          Scrip? lv28 = _cv7!.cv7.remove(lv26);
          _cv6.response(200, "OPC Subscribe successful",
              Response.OPC_SUBSCRIPTION, lv28, lv27);
        } else
          _cv6.response(
              11040, "OPC Subscribe failed", Response.OPC_SUBSCRIPTION);
      }
    }
  }

  bool _f2(av1, av2) {
    int lv1 = Class2.f1(av1.sublist(av2, av2 + 1));
    av2++;
    if (lv1 > 0) {
      av2++;
      int lv2 = Class2.f1(av1.sublist(av2, av2 + 2));
      av2 += 2;
      String lv3 = Class2.f2(av1.sublist(av2, av2 + lv2));
      av2 += lv2;
      if (lv3 == 'K') return true;
    }
    return false;
  }

  void _f3(Class3 av1) {
    List<int?> lv1 = [], lv2 = [];
    for (int lv3 = 0; lv3 < av1.cv11.length; lv3++) {
      if (av1.cv11[lv3] == true) {
        lv1.add(lv3);
        lv2.add(av1.cv10[lv3]);
      }
    }

    if (av1.cv9 == "sf") {
      int lv4 = lv1.indexOf(5);
      int lv5 = lv1.indexOf(21);
      if (lv4 != -1 || lv5 != -1) {
        int? lv6 = av1.cv10[5];
        int? lv7 = av1.cv10[21];
        if (lv6 != null && lv7 != null && lv6 != 0 && lv7 != 0) {
          int lv8 = lv6 - lv7;
          lv1.add(25);
          lv2.add(lv8);

          int lv9 = ((lv8 / lv7) * (av1.cv4! * av1.cv2! * 100))
              .roundToDouble()
              .toInt();
          lv1.add(26);
          lv2.add(lv9);
        }
      }

      int lv10 = lv1.indexOf(4);
      int lv11 = lv1.indexOf(13);
      if (lv10 != -1 || lv11 != -1) {
        int? lv12 = av1.cv10[4];
        int? lv13 = av1.cv10[13];
        if (lv12 != null && lv13 != null && lv12 != 0 && lv13 != 0) {
          int lv14 = lv12 * lv13;
          lv1.add(27);
          lv2.add(lv14);
        }
      }
      _cv6.scripData(av1.cv5, av1.cv7, av1.cv8, lv1, lv2);
    } else if (av1.cv9 == "dp") {
      _cv6.depthData(av1.cv5, av1.cv7, av1.cv8, lv1, lv2);
    } else if (av1.cv9 == "if") {
      int lv15 = lv1.indexOf(2);
      int lv16 = lv1.indexOf(3);
      if (lv15 != -1 || lv16 != -1) {
        int? lv17 = av1.cv10[2];
        int? lv18 = av1.cv10[3];
        if (lv17 != null && lv18 != null && lv17 != 0 && lv18 != 0) {
          int lv19 = lv17 - lv18;
          lv1.add(10);
          lv2.add(lv19);

          int lv20 = ((lv19 / lv18) * (av1.cv4! * av1.cv2! * 100))
              .roundToDouble()
              .toInt();
          lv1.add(11);
          lv2.add(lv20);
        }
      }
      _cv6.indexData(av1.cv5, av1.cv7, av1.cv8, lv1, lv2);
    }
    av1.cv11.fillRange(0, av1.cv11.length, false);
  }
}
