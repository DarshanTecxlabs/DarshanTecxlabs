abstract class Response {
  static const int CONNECTION = 0;
  static const int SUBSCRIPTION = 2;
  static const int UNSUBSCRIPTION = 3;
  static const int CHANNEL = 4;
  static const int SNAPSHOT = 5;
  static const int ERROR = 6;
  static const int CLOSE = 8;
  static const int OPC_SUBSCRIPTION = 9;
}
