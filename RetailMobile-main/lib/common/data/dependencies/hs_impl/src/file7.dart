import 'dart:typed_data';
import 'file10.dart';
import 'file4.dart';

class Class4 {
  static final Uint8List cv1 = Uint8List.fromList([0, 1, 11]);

  static Uint8List? f1(String av1) {
    int lv1 = av1.length;
    final String lv2 = "DartAPI";
    int lv3 = lv2.length;
    Class1 lv4 = new Class1(10 + lv1 + lv3);
    lv4.f1();
    lv4.f5(1);
    lv4.f5(2);
    lv4.f5(1);
    lv4.f9(lv1);
    lv4.f12(av1);
    lv4.f5(2);
    lv4.f9(lv3);
    lv4.f12(lv2);
    lv4.f2();
    return lv4.f4();
  }

  static Uint8List? f2(List<String> av1, int av2, String av3, int av4) {
    Uint8List lv1 = _f3(av1, av3);
    Class1 lv2 = new Class1(11 + lv1.length);
    lv2.f1();
    lv2.f5(av2);
    lv2.f5(2);
    lv2.f5(1);
    lv2.f9(lv1.length);
    lv2.f13(lv1);
    lv2.f5(2);
    lv2.f9(1);
    lv2.f5(av4);
    lv2.f2();
    return lv2.f4();
  }

  static Uint8List _f3(List<String> av1, String av2) {
    int lv1 = 0;
    int lv2 = av1.length;
    for (int i = 0; i < lv2; i++) {
      av1[i] = av2 + "|" + av1[i];
      lv1 += av1[i].length + 1;
    }

    Uint8List lv3 = new Uint8List(lv1 + 2);

    int lv4 = 0;
    lv3[lv4++] = ((lv2 >> 8) & 255);
    lv3[lv4++] = (lv2 & 255);

    for (int i = 0; i < lv2; i++) {
      int lv5 = av1[i].length;
      lv3[lv4++] = lv5;
      for (int j = 0; j < lv5; j++) {
        lv3[lv4++] = av1[i].codeUnitAt(j);
      }
    }
    return lv3;
  }

  static Uint8List? f4(int av1) {
    Class1 lv1 = new Class1(11);
    lv1.f1();
    lv1.f5(3);
    lv1.f5(1);
    lv1.f5(1);
    lv1.f9(4);
    lv1.f10(av1);
    lv1.f2();
    return lv1.f4();
  }

  static Uint8List? f5(int av1, List<int> av2) {
    Class1 lv1 = new Class1(15);
    lv1.f1();
    lv1.f5(av1);
    lv1.f5(1);
    lv1.f5(1);
    lv1.f9(8);
    int lv3 = 0;
    for (final lv2 in av2) {
      if (lv2 < 64 && lv2 > 0) lv3 |= 1 << lv2;
    }
    lv1.f11(lv3);
    lv1.f2();
    return lv1.f4();
  }

  static Uint8List? f6(List<String> av1, int av2, String av3) {
    Uint8List lv1 = _f3(av1, av3);
    Class1 lv2 = new Class1(7 + lv1.length);
    lv2.f1();
    lv2.f5(av2);
    lv2.f5(1);
    lv2.f5(1);
    lv2.f9(lv1.length);
    lv2.f13(lv1);
    lv2.f2();
    return lv2.f4();
  }

  static Uint8List? f7(String av1, String av2, String? av3) {
    final String lv1 = "DartAPI";
    Class1 lv2;
    int lv3 = av2.length + av1.length + lv1.length;
    if (av3 == null) {
      lv2 = new Class1(13 + lv3);
      lv2.f1();
      lv2.f5(1);
      lv2.f5(3);
      _f8(lv2, 1, av1);
      _f8(lv2, 2, av2);
      _f8(lv2, 3, lv1);
      lv2.f2();
    } else {
      lv2 = new Class1(16 + lv3 + av3.length);
      lv2.f1();
      lv2.f5(1);
      lv2.f5(4);
      _f8(lv2, 1, av1);
      _f8(lv2, 2, av2);
      _f8(lv2, 3, av3);
      _f8(lv2, 4, lv1);
      lv2.f2();
    }
    return lv2.f4();
  }

  static void _f8(Class1 av1, av2, String av3) {
    av1.f5(av2);
    av1.f9(av3.length);
    av1.f12(av3);
  }

  static Uint8List? f9(Scrip av1, int av2, int av3, int av4, int av5) {
    String lv1 = av1.getKey();
    Class1 lv2 = new Class1(30 + lv1.length);
    lv2.f1();
    lv2.f5(10);
    lv2.f5(5);

    _f8(lv2, 1, lv1);

    lv2.f5(2);
    lv2.f9(8);
    lv2.f11(av2);

    lv2.f5(3);
    lv2.f9(1);
    lv2.f5(av3);

    lv2.f5(4);
    lv2.f9(1);
    lv2.f5(av4);

    lv2.f5(5);
    lv2.f9(1);
    lv2.f5(av5);

    lv2.f2();
    return lv2.f4();
  }
}
