import 'dart:typed_data';

class Class1 {
  int _cv1 = 0, _cv2 = 0;
  Uint8List? _cv3;

  Class1(av1) {
    _cv3 = new Uint8List(av1);
  }

  void f1() {
    _cv2 = _cv1;
    _cv1 += 2;
  }

  void f2() {
    int lv1 = (_cv1 - _cv2 - 2);
    _cv3![0] = ((lv1 >> 8) & 255);
    _cv3![1] = (lv1 & 255);
  }

  void f3() {
    _cv1 = 0;
  }

  Uint8List? f4() {
    return _cv3;
  }

  void f5(b) {
    _cv3![_cv1++] = b;
  }

  void f6(av1, av2) {
    _cv3![av1] = av2;
  }

  void f7(av1) {
    _cv3![_cv1++] = av1;
  }

  void f8(av1, av2) {
    _cv3![av1] = av2;
  }

  void f9(av1) {
    _cv3![_cv1++] = ((av1 >> 8) & 255);
    _cv3![_cv1++] = (av1 & 255);
  }

  void f10(av1) {
    _cv3![_cv1++] = ((av1 >> 24) & 255);
    _cv3![_cv1++] = ((av1 >> 16) & 255);
    _cv3![_cv1++] = ((av1 >> 8) & 255);
    _cv3![_cv1++] = (av1 & 255);
  }

  void f11(av1) {
    _cv3![_cv1++] = ((av1 >> 56) & 255);
    _cv3![_cv1++] = ((av1 >> 48) & 255);
    _cv3![_cv1++] = ((av1 >> 40) & 255);
    _cv3![_cv1++] = ((av1 >> 32) & 255);
    _cv3![_cv1++] = ((av1 >> 24) & 255);
    _cv3![_cv1++] = ((av1 >> 16) & 255);
    _cv3![_cv1++] = ((av1 >> 8) & 255);
    _cv3![_cv1++] = (av1 & 255);
  }

  void f12(String av1) {
    int lv1 = av1.length;
    for (int i = 0; i < lv1; i++) {
      _cv3![_cv1++] = av1.codeUnitAt(i);
    }
  }

  void f13(av1) {
    for (int i = 0; i < av1.length; i++) _cv3![_cv1++] = av1[i];
  }

  void f14(av1, av2) {
    for (int i = 0; i < av2; i++) _cv3![_cv1++] = av1[i];
  }
}
