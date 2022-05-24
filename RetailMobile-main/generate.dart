void main() {
  List<String> elements = [];
  String s = "";
  String b = "bid";
  String o = "offer";
  String or = "Order";
  String q = "Quantity";
  String p = "Price";

  // String ifCond = " ";
  String ifClose = "\n}";

  // File file = File(
  //     "/Users/neosoft/projects/RetailMobile/lib/feature/watchlist/data/models/stock.dart");

  for (int i = 1; i <= 5; i++) {
    // file.writeAsStringSync(
    elements.add("$s$b$p$i\n");
    // , mode: FileMode.append);
  }
  for (int i = 1; i <= 5; i++) {
    elements.add("$s$o$p$i\n");
    // file.writeAsStringSync("$s$b$or$i,\n", mode: FileMode.append);
  }
  for (int i = 1; i <= 5; i++) {
    elements.add("$s$b$q$i\n");
    // file.writeAsStringSync("$s$b$q$i,\n", mode: FileMode.append);
  }
  for (int i = 1; i <= 5; i++) {
    elements.add("$s$o$q$i\n");
    // file.writeAsStringSync("$s$o$p$i,\n", mode: FileMode.append);
  }
  for (int i = 1; i <= 5; i++) {
    elements.add("$s$b$or$i\n");
    // file.writeAsStringSync("$s$o$or$i,\n", mode: FileMode.append);
  }
  for (int i = 1; i <= 5; i++) {
    elements.add("$s$o$or$i\n");
    // file.writeAsStringSync("$s$o$q$i,\n", mode: FileMode.append);
  }
  print(elements);

  for (int i = 2; i <= 31; i++) {
    print(
        "if(fieldIndices.contains($i)) { \n int index = fieldIndices.indexOf($i); \n model.${elements[i - 2]} = fiedValues[index]; $ifClose");
  }
}
