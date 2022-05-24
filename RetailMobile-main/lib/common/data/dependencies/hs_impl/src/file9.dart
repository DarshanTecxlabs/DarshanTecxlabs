class Class2 {
  static int f1(av1) {
    int lv1 = 0;
    int lv2 = av1.length;

    for (var i = 0, j = lv2 - 1; i < lv2; i++, j--)
      lv1 += (av1[j] << (i * 8)) as int;
    return lv1;
  }

  static String f2(av2) {
    return String.fromCharCodes(av2);
  }
}
