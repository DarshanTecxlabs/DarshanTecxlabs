class Holdingrequest{
  final String? prod;
  final String? brkName;

  const Holdingrequest({this.prod, this.brkName});

  Map<String, dynamic> toJson() => {
    'prod':prod,
    'brkName':brkName
  };
}