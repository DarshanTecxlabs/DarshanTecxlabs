import 'dart:math';

class Class3 {
  int? cv1, cv2, cv3, cv4;
  String? cv5, cv6, cv7, cv8, cv9;
  late List<int?> cv10;
  late List<bool> cv11;

  static const int cv12 = 2147483648;
  static const cv13 = {
    'sf': {'max': 28, 'mul': 23, 'pre': 24},
    'if': {'max': 12, 'mul': 8, 'pre': 9},
    'dp': {'max': 34, 'mul': 32, 'pre': 33}
  };

  Class3(int av1, String av2) {
    this.cv1 = av1;
    this.cv6 = av2;

    List<String> lv1 = av2.split("|");
    if (lv1.length == 3) {
      cv9 = lv1[0];
      cv7 = lv1[1];
      cv8 = lv1[2];
      cv5 = av2.substring(3);

      int lv2 = cv13[cv9!]!['max']!;
      cv10 = List.filled(lv2, null);
      cv11 = List.filled(lv2, false);
    }
  }

  void f1(int av1, int av2) {
    if (cv10[av1] != av2 && av2 < cv12) {
      cv10[av1] = av2;
      cv11[av1] = true;
    }
  }

  void f2() {
    int lv1 = cv13[cv9!]!['mul']!;
    cv2 = cv11[lv1] ? cv10[lv1] : 1;
    lv1 = cv13[cv9!]!['pre']!;
    cv3 = cv11[lv1] ? cv10[lv1] : 2;
    cv4 = pow(10, cv3!) as int?;
  }
}
