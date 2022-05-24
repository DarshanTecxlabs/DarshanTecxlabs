class OrderentryRequest {
  final String? am;
  final String? es; //Exchange Segment
  final String? pc; //Product Code
  final String? pr; //price
  final String? ot; //Order type
  final String? qt; //Quantity
  final String? rt; //Retention type
  final String? tk; //Token
  final String? tp; //Trigger Price
  final String? ts; //Trading Symbol
  final String? tt; //Transaction Type
  //final String?ig;//GuiOrderId (its Madatory, if GUIId check is enabled from Server)
  final String? os;
  final String? dq;

  const OrderentryRequest(
      {this.am,
      this.es,
      this.pc,
      this.pr,
      this.ot,
      this.qt,
      this.rt,
      this.tk,
      this.tp,
      this.ts,
      this.tt,
      this.os,
      this.dq});

  Map<String, dynamic> toJson() => {
        'am': am,
        'es': es, //Exchange Segment
        'pc': pc, //Product Code
        'pr': pr, //price
        'ot': ot, //Order type
        'qt': qt, //Quantity
        'rt': rt, //Retention type
        'tk': tk, //Token
        'tp': tp, //Trigger Price
        'ts': ts, //Trading Symbol
        'tt': tt, //Transaction Type
        //'ig':ig,//GuiOrderId (its Madatory, if GUIId check is enabled from Server)
        'os': os,
        'dq': dq
      };
}
