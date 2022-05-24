// To parse this JSON data, do
//
//     final positionModel = positionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PositionModel positionModelFromJson(String str) => PositionModel.fromJson(json.decode(str));

String positionModelToJson(PositionModel data) => json.encode(data.toJson());

class PositionModel {
    PositionModel({
        required this.stat,
        required this.stCode,
        required this.data,
    });

    String stat;
    int stCode;
    List<Position> data;

    factory PositionModel.fromJson(Map<String, dynamic> json) => PositionModel(
        stat: json["stat"],
        stCode: json["stCode"],
        data: List<Position>.from(json["data"].map((x) => Position.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "stat": stat,
        "stCode": stCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Position {
    Position({
        required this.buyAmt,
        required this.cfSellAmt,
        required this.prod,
        required this.exSeg,
        required this.sqrFlg,
        required this.actId,
        required this.cfBuyQty,
        required this.hsUpTm,
        required this.cfSellQty,
        required this.tok,
        required this.flBuyQty,
        required this.flSellQty,
        required this.sellAmt,
        required this.posFlg,
        required this.cfBuyAmt,
        required this.series,
        required this.stkPrc,
        required this.trdSym,
        required this.sym,
        required this.brdLtQty,
        required this.expDt,
        required this.exp,
        required this.type,
        required this.optTp,
    });

    String buyAmt;
    String cfSellAmt;
    String prod;
    String exSeg;
    String sqrFlg;
    String actId;
    String cfBuyQty;
    String hsUpTm;
    String cfSellQty;
    String tok;
    String flBuyQty;
    String flSellQty;
    String sellAmt;
    String posFlg;
    String cfBuyAmt;
    String series;
    String stkPrc;
    String trdSym;
    String sym;
    int brdLtQty;
    String expDt;
    String exp;
    String type;
    String optTp;

    factory Position.fromJson(Map<String, dynamic> json) => Position(
        buyAmt: json["buyAmt"],
        cfSellAmt: json["cfSellAmt"],
        prod: json["prod"],
        exSeg: json["exSeg"],
        sqrFlg: json["sqrFlg"],
        actId: json["actId"],
        cfBuyQty: json["cfBuyQty"],
        hsUpTm: json["hsUpTm"],
        cfSellQty: json["cfSellQty"],
        tok: json["tok"],
        flBuyQty: json["flBuyQty"],
        flSellQty: json["flSellQty"],
        sellAmt: json["sellAmt"],
        posFlg: json["posFlg"],
        cfBuyAmt: json["cfBuyAmt"],
        series: json["series"],
        stkPrc: json["stkPrc"],
        trdSym: json["trdSym"],
        sym: json["sym"],
        brdLtQty: json["brdLtQty"],
        expDt: json["expDt"],
        exp: json["exp"],
        type: json["type"],
        optTp: json["optTp"],
    );

    Map<String, dynamic> toJson() => {
        "buyAmt": buyAmt,
        "cfSellAmt": cfSellAmt,
        "prod": prod,
        "exSeg": exSeg,
        "sqrFlg": sqrFlg,
        "actId": actId,
        "cfBuyQty": cfBuyQty,
        "hsUpTm": hsUpTm,
        "cfSellQty": cfSellQty,
        "tok": tok,
        "flBuyQty": flBuyQty,
        "flSellQty": flSellQty,
        "sellAmt": sellAmt,
        "posFlg": posFlg,
        "cfBuyAmt": cfBuyAmt,
        "series": series,
        "stkPrc": stkPrc,
        "trdSym": trdSym,
        "sym": sym,
        "brdLtQty": brdLtQty,
        "expDt": expDt,
        "exp": exp,
        "type": type,
        "optTp": optTp,
    };
}
