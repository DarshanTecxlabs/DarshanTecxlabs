class Scrip {
  String exchange, token, expDate;
  Scrip(this.exchange, this.token, this.expDate);
  String getKey() => "$exchange|$token|$expDate";
}
