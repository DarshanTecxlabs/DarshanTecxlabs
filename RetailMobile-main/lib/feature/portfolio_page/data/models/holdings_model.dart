// To parse this JSON data, do
//
//     final holdingsModel = holdingsModelFromJson(jsonString);

import 'dart:convert';

HoldingsModel holdingsModelFromJson(String str) =>
    HoldingsModel.fromJson(json.decode(str));

String holdingsModelToJson(HoldingsModel data) => json.encode(data.toJson());

class HoldingsModel {
  HoldingsModel({
    required this.stat,
    required this.hldVal,
    required this.clntId,
    required this.stCode,
  });

  String stat;
  List<Holding> hldVal;
  String clntId;
  int stCode;

  factory HoldingsModel.fromJson(Map<String, dynamic> json) => HoldingsModel(
        stat: json["stat"],
        hldVal:
            List<Holding>.from(json["hldVal"].map((x) => Holding.fromJson(x))),
        clntId: json["clntId"],
        stCode: json["stCode"],
      );

  Map<String, dynamic> toJson() => {
        "stat": stat,
        "hldVal": List<dynamic>.from(hldVal.map((x) => x.toJson())),
        "clntId": clntId,
        "stCode": stCode,
      };
}

class Holding {
  Holding({
    required this.bseTrdSym,
    required this.nseTrdSym,
    required this.mcxsxcmTrdSym,
    required this.ex1,
    required this.ex2,
    required this.ex3,
    required this.usdQty,
    required this.hldQty,
    required this.btstHld,
    required this.scripCode,
    required this.series,
    required this.prod,
    required this.colTp,
    required this.hldUpdQty,
    required this.whdHldQty,
    required this.colQty,
    required this.colUpdQty,
    required this.whdColQty,
    required this.prc,
    required this.hrCutPrc,
    required this.ltNse,
    required this.ltBse,
    required this.ltMcxsxcm,
    required this.tgtProd,
    required this.tok1,
    required this.tok2,
    required this.tok3,
    required this.slbQty,
    required this.exSeg1,
    required this.exSeg2,
    required this.exSeg3,
    required this.buyQty,
    required this.series1,
    required this.isin,
    required this.cncBrkg,
    required this.t1Qty,
  });

  String bseTrdSym;
  String nseTrdSym;
  String mcxsxcmTrdSym;
  String ex1;
  String ex2;
  String ex3;
  String usdQty;
  String hldQty;
  String btstHld;
  String scripCode;
  String series;
  String prod;
  String colTp;
  String hldUpdQty;
  String whdHldQty;
  String colQty;
  String colUpdQty;
  String whdColQty;
  String prc;
  String hrCutPrc;
  String ltNse;
  String ltBse;
  String ltMcxsxcm;
  String tgtProd;
  String tok1;
  String tok2;
  String tok3;
  String slbQty;
  String exSeg1;
  String exSeg2;
  String exSeg3;
  String buyQty;
  String series1;
  String isin;
  String cncBrkg;
  String t1Qty;

  factory Holding.fromJson(Map<String, dynamic> json) => Holding(
        bseTrdSym: json["bseTrdSym"],
        nseTrdSym: json["nseTrdSym"],
        mcxsxcmTrdSym: json["mcxsxcmTrdSym"],
        ex1: json["ex1"],
        ex2: json["ex2"],
        ex3: json["ex3"],
        usdQty: json["usdQty"],
        hldQty: json["hldQty"],
        btstHld: json["btstHld"],
        scripCode: json["scripCode"],
        series: json["series"],
        prod: json["prod"],
        colTp: json["colTp"],
        hldUpdQty: json["hldUpdQty"],
        whdHldQty: json["whdHldQty"],
        colQty: json["colQty"],
        colUpdQty: json["colUpdQty"],
        whdColQty: json["whdColQty"],
        prc: json["prc"],
        hrCutPrc: json["hrCutPrc"],
        ltNse: json["ltNse"],
        ltBse: json["ltBse"],
        ltMcxsxcm: json["ltMcxsxcm"],
        tgtProd: json["tgtProd"],
        tok1: json["tok1"],
        tok2: json["tok2"],
        tok3: json["tok3"],
        slbQty: json["slbQty"],
        exSeg1: json["exSeg1"],
        exSeg2: json["exSeg2"],
        exSeg3: json["exSeg3"],
        buyQty: json["buyQty"],
        series1: json["series1"],
        isin: json["isin"],
        cncBrkg: json["cncBrkg"],
        t1Qty: json["t1Qty"],
      );

  Map<String, dynamic> toJson() => {
        "bseTrdSym": bseTrdSym,
        "nseTrdSym": nseTrdSym,
        "mcxsxcmTrdSym": mcxsxcmTrdSym,
        "ex1": ex1,
        "ex2": ex2,
        "ex3": ex3,
        "usdQty": usdQty,
        "hldQty": hldQty,
        "btstHld": btstHld,
        "scripCode": scripCode,
        "series": series,
        "prod": prod,
        "colTp": colTp,
        "hldUpdQty": hldUpdQty,
        "whdHldQty": whdHldQty,
        "colQty": colQty,
        "colUpdQty": colUpdQty,
        "whdColQty": whdColQty,
        "prc": prc,
        "hrCutPrc": hrCutPrc,
        "ltNse": ltNse,
        "ltBse": ltBse,
        "ltMcxsxcm": ltMcxsxcm,
        "tgtProd": tgtProd,
        "tok1": tok1,
        "tok2": tok2,
        "tok3": tok3,
        "slbQty": slbQty,
        "exSeg1": exSeg1,
        "exSeg2": exSeg2,
        "exSeg3": exSeg3,
        "buyQty": buyQty,
        "series1": series1,
        "isin": isin,
        "cncBrkg": cncBrkg,
        "t1Qty": t1Qty,
      };
}
