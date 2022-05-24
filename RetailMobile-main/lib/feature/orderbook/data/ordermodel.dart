import 'package:equatable/equatable.dart';

class Ordermodel extends Equatable {
  final String? algId;
  final String? avgPrc;
  final String? brdLtQty;
  final String? brkClnt;
  final int? cnlQty;
  final double? coPct;
  final String? defMktProV;
  final String? dscQtyPct;
  final int? dscQty;
  final String? exUsrInfo;
  final String? exCfmTm;
  final String? exOrdId;
  final String? expDt;
  final String? expDtSsb;
  final String? exSeg;
  final int? fldQty;
  final String? mktProPct;
  final String? mktPro;
  final String? mfdBy;
  final String? mktProFlg;
  final String? noMktProFlg;
  final String? nOrdNo;
  final String? optTp;
  final String? ordAutSt;
  final String? odCrt;
  final String? ordDtTm;
  final String? ordEntTm;
  final String? ordGenTp;
  final String? ordSrc;
  final String? ordValDt;
  final String? prod;
  final String? prc;
  final String? prcTp;
  final int? qty;
  final double? refLmtPrc;
  final String? rejRsn;
  final String? rmk;
  final String? rptTp;
  final String? reqId;
  final String? series;
  final String? sipInd;
  final String? stat;
  final String? ordSt;
  final String? stkPrc;
  final String? sym;
  final String? symOrdId;
  final String? tckSz;
  final String? tok;
  final String? trnsTp;
  final String? trgPrc;
  final int? unFldSz;
  final String? usrId;
  final String? vldt;

  const Ordermodel(
      {this.algId,
      this.avgPrc,
      this.brdLtQty,
      this.brkClnt,
      this.cnlQty,
      this.coPct,
      this.defMktProV,
      this.dscQtyPct,
      this.dscQty,
      this.exUsrInfo,
      this.exCfmTm,
      this.exOrdId,
      this.expDt,
      this.expDtSsb,
      this.exSeg,
      this.fldQty,
      this.mktProPct,
      this.mktPro,
      this.mfdBy,
      this.mktProFlg,
      this.noMktProFlg,
      this.nOrdNo,
      this.optTp,
      this.ordAutSt,
      this.odCrt,
      this.ordDtTm,
      this.ordEntTm,
      this.ordGenTp,
      this.ordSrc,
      this.ordValDt,
      this.prod,
      this.prc,
      this.prcTp,
      this.qty,
      this.refLmtPrc,
      this.rejRsn,
      this.rmk,
      this.rptTp,
      this.reqId,
      this.series,
      this.sipInd,
      this.stat,
      this.ordSt,
      this.stkPrc,
      this.sym,
      this.symOrdId,
      this.tckSz,
      this.tok,
      this.trnsTp,
      this.trgPrc,
      this.unFldSz,
      this.usrId,
      this.vldt});

  factory Ordermodel.fromJson(Map<String, dynamic> json) => Ordermodel(
        algId: json['algId'] as String?,
        avgPrc: json['avgPrc'] as String?,
        brdLtQty: json['brdLtQty'] as String?,
        brkClnt: json['brkClnt'] as String?,
        cnlQty: json['cnlQty'] as int?,
        coPct: json['coPct'] as double?,
        defMktProV: json['defMktProV'] as String?,
        dscQtyPct: json['dscQtyPct'] as String?,
        dscQty: json['dscQty'] as int?,
        exUsrInfo: json['exUsrInfo'] as String?,
        exCfmTm: json['exCfmTm'] as String?,
        exOrdId: json['exOrdId'] as String?,
        expDt: json['expDt'] as String?,
        expDtSsb: json['expDtSsb'] as String?,
        exSeg: json['exSeg'] as String?,
        fldQty: json['fldQty'] as int?,
        mktProPct: json['mktProPct'] as String?,
        mktPro: json['mktPro'] as String?,
        mfdBy: json['mfdBy'] as String?,
        mktProFlg: json['mktProFlg'] as String?,
        noMktProFlg: json['noMktProFlg'] as String?,
        nOrdNo: json['nOrdNo'] as String?,
        optTp: json['optTp'] as String?,
        ordAutSt: json['ordAutSt'] as String?,
        odCrt: json['odCrt'] as String?,
        ordDtTm: json['ordDtTm'] as String?,
        ordEntTm: json['ordEntTm'] as String?,
        ordGenTp: json['ordGenTp'] as String?,
        ordSrc: json['ordSrc'] as String?,
        ordValDt: json['ordValDt'] as String?,
        prod: json['prod'] as String?,
        prc: json['prc'] as String?,
        prcTp: json['prcTp'] as String?,
        qty: json['qty'] as int?,
        refLmtPrc: json['refLmtPrc'] as double?,
        rejRsn: json['rejRsn'] as String?,
        rmk: json['rmk'] as String?,
        rptTp: json['rptTp'] as String?,
        reqId: json['reqId'] as String?,
        series: json['series'] as String?,
        sipInd: json['sipInd'] as String?,
        stat: json['stat'] as String?,
        ordSt: json['ordSt'] as String?,
        stkPrc: json['stkPrc'] as String?,
        sym: json['sym'] as String?,
        symOrdId: json['symOrdId'] as String?,
        tckSz: json['tckSz'] as String?,
        tok: json['tok'] as String?,
        trnsTp: json['trnsTp'] as String?,
        trgPrc: json['trgPrc'] as String?,
        unFldSz: json['unFldSz'] as int?,
        usrId: json['usrId'] as String?,
        vldt: json['vldt'] as String?,
      );

  @override
  List<Object?> get props => [
        algId,
        avgPrc,
        brdLtQty,
        brkClnt,
        cnlQty,
        coPct,
        defMktProV,
        dscQtyPct,
        dscQty,
        exUsrInfo,
        exCfmTm,
        exOrdId,
        expDt,
        expDtSsb,
        exSeg,
        fldQty,
        mktProPct,
        mktPro,
        mfdBy,
        mktProFlg,
        noMktProFlg,
        nOrdNo,
        optTp,
        ordAutSt,
        odCrt,
        ordDtTm,
        ordEntTm,
        ordGenTp,
        ordSrc,
        ordValDt,
        prod,
        prc,
        prcTp,
        qty,
        refLmtPrc,
        rejRsn,
        rmk,
        rptTp,
        reqId,
        series,
        sipInd,
        stat,
        ordSt,
        stkPrc,
        sym,
        symOrdId,
        tckSz,
        tok,
        trnsTp,
        trgPrc,
        unFldSz,
        usrId,
        vldt
      ];
}
