import 'package:flutter/foundation.dart';

import 'exch_token.dart';

class ScripData {
  final String? issDt;
  final String? listDt;
  final String? ltDt;
  final String? refKey;
  final String? admnDt;
  final String? minRdQt;
  final String? multplr;
  final String? rmk;
  final String? expsnDt;
  final String? freeze;
  final String? genNum;
  final String? prcUnits;
  final String? instInf;
  final String? prcQuot;
  final String? updTime;
  final String? precFrt;
  final String? tenEdDt;
  final String? genDen;
  final String? brdLtQty;
  final String? sellVarM;
  final String? delStDt;
  final String? nav;
  final String? combSym;
  final String? trdSym;
  final String? navDt;
  final String? noMkPro;
  final String? cmpName;
  final String? pmtdToTrade;
  final String? exprMrgn;
  final String? mktPro;
  final String? sipSec;
  final String? unqKey;
  final String? strkPrc;
  final String? warn;
  final String? defMkt;
  final String? recDt;
  final String? buyVarMrgn;
  final String? prcNum;
  final String? maxQty;
  final String? lotSz;
  final String? desc;
  final String? prcDen;
  final String? mfAmt;
  final String? exEndDt;
  final String? asstCd;
  final String? dscQty;
  final String? clsEnd;
  final String? sym;
  final String? crpActn;
  final String? instTyp;
  final String? expDt;
  final String? exStrDt;
  final String? exprDt;
  final String? thrtPrc;
  final String? idxId;
  final String? lPrcRng;
  final String? matrDt;
  final String? tok;
  final String? hPrcRng;
  final String? delUnits;
  final String? maxOrdSz;
  final String? seg;
  final String? issRt;
  final String? prcn;
  final List<ExchToken>? exchTokens;
  final String? delEdDt;
  final String? exSeg;
  final String? crdtRtg;
  final String? issCptl;
  final String? tenStDt;
  final String? optType;
  final String? tckSz;
  final String? series;
  final String? exch;
  final String? inst;
  final String? sptPrc;
  final String? clsStrt;
  final String? modfr;
  final String? isin;
  final String? minQty;

  const ScripData({
    this.issDt,
    this.listDt,
    this.ltDt,
    this.refKey,
    this.admnDt,
    this.minRdQt,
    this.multplr,
    this.rmk,
    this.expsnDt,
    this.freeze,
    this.genNum,
    this.prcUnits,
    this.instInf,
    this.prcQuot,
    this.updTime,
    this.precFrt,
    this.tenEdDt,
    this.genDen,
    this.brdLtQty,
    this.sellVarM,
    this.delStDt,
    this.nav,
    this.combSym,
    this.trdSym,
    this.navDt,
    this.noMkPro,
    this.cmpName,
    this.pmtdToTrade,
    this.exprMrgn,
    this.mktPro,
    this.sipSec,
    this.unqKey,
    this.strkPrc,
    this.warn,
    this.defMkt,
    this.recDt,
    this.buyVarMrgn,
    this.prcNum,
    this.maxQty,
    this.lotSz,
    this.desc,
    this.prcDen,
    this.mfAmt,
    this.exEndDt,
    this.asstCd,
    this.dscQty,
    this.clsEnd,
    this.sym,
    this.crpActn,
    this.instTyp,
    this.expDt,
    this.exStrDt,
    this.exprDt,
    this.thrtPrc,
    this.idxId,
    this.lPrcRng,
    this.matrDt,
    this.tok,
    this.hPrcRng,
    this.delUnits,
    this.maxOrdSz,
    this.seg,
    this.issRt,
    this.prcn,
    this.exchTokens,
    this.delEdDt,
    this.exSeg,
    this.crdtRtg,
    this.issCptl,
    this.tenStDt,
    this.optType,
    this.tckSz,
    this.series,
    this.exch,
    this.inst,
    this.sptPrc,
    this.clsStrt,
    this.modfr,
    this.isin,
    this.minQty,
  });

  @override
  String toString() {
    return 'ScripData(issDt: $issDt, listDt: $listDt, ltDt: $ltDt, refKey: $refKey, admnDt: $admnDt, minRdQt: $minRdQt, multplr: $multplr, rmk: $rmk, expsnDt: $expsnDt, freeze: $freeze, genNum: $genNum, prcUnits: $prcUnits, instInf: $instInf, prcQuot: $prcQuot, updTime: $updTime, precFrt: $precFrt, tenEdDt: $tenEdDt, genDen: $genDen, brdLtQty: $brdLtQty, sellVarM: $sellVarM, delStDt: $delStDt, nav: $nav, combSym: $combSym, trdSym: $trdSym, navDt: $navDt, noMkPro: $noMkPro, cmpName: $cmpName, pmtdToTrade: $pmtdToTrade, exprMrgn: $exprMrgn, mktPro: $mktPro, sipSec: $sipSec, unqKey: $unqKey, strkPrc: $strkPrc, warn: $warn, defMkt: $defMkt, recDt: $recDt, buyVarMrgn: $buyVarMrgn, prcNum: $prcNum, maxQty: $maxQty, lotSz: $lotSz, desc: $desc, prcDen: $prcDen, mfAmt: $mfAmt, exEndDt: $exEndDt, asstCd: $asstCd, dscQty: $dscQty, clsEnd: $clsEnd, sym: $sym, crpActn: $crpActn, instTyp: $instTyp, expDt: $expDt, exStrDt: $exStrDt, exprDt: $exprDt, thrtPrc: $thrtPrc, idxId: $idxId, lPrcRng: $lPrcRng, matrDt: $matrDt, tok: $tok, hPrcRng: $hPrcRng, delUnits: $delUnits, maxOrdSz: $maxOrdSz, seg: $seg, issRt: $issRt, prcn: $prcn, exchTokens: $exchTokens, delEdDt: $delEdDt, exSeg: $exSeg, crdtRtg: $crdtRtg, issCptl: $issCptl, tenStDt: $tenStDt, optType: $optType, tckSz: $tckSz, series: $series, exch: $exch, inst: $inst, sptPrc: $sptPrc, clsStrt: $clsStrt, modfr: $modfr, isin: $isin, minQty: $minQty)';
  }

  factory ScripData.fromJson(Map<String, dynamic> json) => ScripData(
        issDt: json['issDt'] as String?,
        listDt: json['listDt'] as String?,
        ltDt: json['ltDt'] as String?,
        refKey: json['refKey'] as String?,
        admnDt: json['admnDt'] as String?,
        minRdQt: json['minRdQt'] as String?,
        multplr: json['multplr'] as String?,
        rmk: json['rmk'] as String?,
        expsnDt: json['expsnDt'] as String?,
        freeze: json['freeze'] as String?,
        genNum: json['genNum'] as String?,
        prcUnits: json['prcUnits'] as String?,
        instInf: json['instInf'] as String?,
        prcQuot: json['prcQuot'] as String?,
        updTime: json['updTime'] as String?,
        precFrt: json['precFrt'] as String?,
        tenEdDt: json['tenEdDt'] as String?,
        genDen: json['genDen'] as String?,
        brdLtQty: json['brdLtQty'] as String?,
        sellVarM: json['sellVarM'] as String?,
        delStDt: json['delStDt'] as String?,
        nav: json['nav'] as String?,
        combSym: json['combSym'] as String?,
        trdSym: json['trdSym'] as String?,
        navDt: json['navDt'] as String?,
        noMkPro: json['noMkPro'] as String?,
        cmpName: json['cmpName'] as String?,
        pmtdToTrade: json['pmtdToTrade'] as String?,
        exprMrgn: json['exprMrgn'] as String?,
        mktPro: json['mktPro'] as String?,
        sipSec: json['sipSec'] as String?,
        unqKey: json['unqKey'] as String?,
        strkPrc: json['strkPrc'] as String?,
        warn: json['warn'] as String?,
        defMkt: json['defMkt'] as String?,
        recDt: json['recDt'] as String?,
        buyVarMrgn: json['buyVarMrgn'] as String?,
        prcNum: json['prcNum'] as String?,
        maxQty: json['maxQty'] as String?,
        lotSz: json['lotSz'] as String?,
        desc: json['desc'] as String?,
        prcDen: json['prcDen'] as String?,
        mfAmt: json['mfAmt'] as String?,
        exEndDt: json['exEndDt'] as String?,
        asstCd: json['asstCd'] as String?,
        dscQty: json['dscQty'] as String?,
        clsEnd: json['clsEnd'] as String?,
        sym: json['sym'] as String?,
        crpActn: json['crpActn'] as String?,
        instTyp: json['instTyp'] as String?,
        expDt: json['expDt'] as String?,
        exStrDt: json['exStrDt'] as String?,
        exprDt: json['exprDt'] as String?,
        thrtPrc: json['thrtPrc'] as String?,
        idxId: json['idxId'] as String?,
        lPrcRng: json['lPrcRng'] as String?,
        matrDt: json['matrDt'] as String?,
        tok: json['tok'] as String?,
        hPrcRng: json['hPrcRng'] as String?,
        delUnits: json['delUnits'] as String?,
        maxOrdSz: json['maxOrdSz'] as String?,
        seg: json['seg'] as String?,
        issRt: json['issRt'] as String?,
        prcn: json['prcn'] as String?,
        exchTokens: (json['exchTokens'] as List<dynamic>?)
            ?.map((e) => ExchToken.fromJson(e as Map<String, dynamic>))
            .toList(),
        delEdDt: json['delEdDt'] as String?,
        exSeg: json['exSeg'] as String?,
        crdtRtg: json['crdtRtg'] as String?,
        issCptl: json['issCptl'] as String?,
        tenStDt: json['tenStDt'] as String?,
        optType: json['optType'] as String?,
        tckSz: json['tckSz'] as String?,
        series: json['series'] as String?,
        exch: json['exch'] as String?,
        inst: json['inst'] as String?,
        sptPrc: json['sptPrc'] as String?,
        clsStrt: json['clsStrt'] as String?,
        modfr: json['modfr'] as String?,
        isin: json['isin'] as String?,
        minQty: json['minQty'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'issDt': issDt,
        'listDt': listDt,
        'ltDt': ltDt,
        'refKey': refKey,
        'admnDt': admnDt,
        'minRdQt': minRdQt,
        'multplr': multplr,
        'rmk': rmk,
        'expsnDt': expsnDt,
        'freeze': freeze,
        'genNum': genNum,
        'prcUnits': prcUnits,
        'instInf': instInf,
        'prcQuot': prcQuot,
        'updTime': updTime,
        'precFrt': precFrt,
        'tenEdDt': tenEdDt,
        'genDen': genDen,
        'brdLtQty': brdLtQty,
        'sellVarM': sellVarM,
        'delStDt': delStDt,
        'nav': nav,
        'combSym': combSym,
        'trdSym': trdSym,
        'navDt': navDt,
        'noMkPro': noMkPro,
        'cmpName': cmpName,
        'pmtdToTrade': pmtdToTrade,
        'exprMrgn': exprMrgn,
        'mktPro': mktPro,
        'sipSec': sipSec,
        'unqKey': unqKey,
        'strkPrc': strkPrc,
        'warn': warn,
        'defMkt': defMkt,
        'recDt': recDt,
        'buyVarMrgn': buyVarMrgn,
        'prcNum': prcNum,
        'maxQty': maxQty,
        'lotSz': lotSz,
        'desc': desc,
        'prcDen': prcDen,
        'mfAmt': mfAmt,
        'exEndDt': exEndDt,
        'asstCd': asstCd,
        'dscQty': dscQty,
        'clsEnd': clsEnd,
        'sym': sym,
        'crpActn': crpActn,
        'instTyp': instTyp,
        'expDt': expDt,
        'exStrDt': exStrDt,
        'exprDt': exprDt,
        'thrtPrc': thrtPrc,
        'idxId': idxId,
        'lPrcRng': lPrcRng,
        'matrDt': matrDt,
        'tok': tok,
        'hPrcRng': hPrcRng,
        'delUnits': delUnits,
        'maxOrdSz': maxOrdSz,
        'seg': seg,
        'issRt': issRt,
        'prcn': prcn,
        'exchTokens': exchTokens?.map((e) => e.toJson()).toList(),
        'delEdDt': delEdDt,
        'exSeg': exSeg,
        'crdtRtg': crdtRtg,
        'issCptl': issCptl,
        'tenStDt': tenStDt,
        'optType': optType,
        'tckSz': tckSz,
        'series': series,
        'exch': exch,
        'inst': inst,
        'sptPrc': sptPrc,
        'clsStrt': clsStrt,
        'modfr': modfr,
        'isin': isin,
        'minQty': minQty,
      };

  ScripData copyWith({
    String? issDt,
    String? listDt,
    String? ltDt,
    String? refKey,
    String? admnDt,
    String? minRdQt,
    String? multplr,
    String? rmk,
    String? expsnDt,
    String? freeze,
    String? genNum,
    String? prcUnits,
    String? instInf,
    String? prcQuot,
    String? updTime,
    String? precFrt,
    String? tenEdDt,
    String? genDen,
    String? brdLtQty,
    String? sellVarM,
    String? delStDt,
    String? nav,
    String? combSym,
    String? trdSym,
    String? navDt,
    String? noMkPro,
    String? cmpName,
    String? pmtdToTrade,
    String? exprMrgn,
    String? mktPro,
    String? sipSec,
    String? unqKey,
    String? strkPrc,
    String? warn,
    String? defMkt,
    String? recDt,
    String? buyVarMrgn,
    String? prcNum,
    String? maxQty,
    String? lotSz,
    String? desc,
    String? prcDen,
    String? mfAmt,
    String? exEndDt,
    String? asstCd,
    String? dscQty,
    String? clsEnd,
    String? sym,
    String? crpActn,
    String? instTyp,
    String? expDt,
    String? exStrDt,
    String? exprDt,
    String? thrtPrc,
    String? idxId,
    String? lPrcRng,
    String? matrDt,
    String? tok,
    String? hPrcRng,
    String? delUnits,
    String? maxOrdSz,
    String? seg,
    String? issRt,
    String? prcn,
    List<ExchToken>? exchTokens,
    String? delEdDt,
    String? exSeg,
    String? crdtRtg,
    String? issCptl,
    String? tenStDt,
    String? optType,
    String? tckSz,
    String? series,
    String? exch,
    String? inst,
    String? sptPrc,
    String? clsStrt,
    String? modfr,
    String? isin,
    String? minQty,
  }) {
    return ScripData(
      issDt: issDt ?? this.issDt,
      listDt: listDt ?? this.listDt,
      ltDt: ltDt ?? this.ltDt,
      refKey: refKey ?? this.refKey,
      admnDt: admnDt ?? this.admnDt,
      minRdQt: minRdQt ?? this.minRdQt,
      multplr: multplr ?? this.multplr,
      rmk: rmk ?? this.rmk,
      expsnDt: expsnDt ?? this.expsnDt,
      freeze: freeze ?? this.freeze,
      genNum: genNum ?? this.genNum,
      prcUnits: prcUnits ?? this.prcUnits,
      instInf: instInf ?? this.instInf,
      prcQuot: prcQuot ?? this.prcQuot,
      updTime: updTime ?? this.updTime,
      precFrt: precFrt ?? this.precFrt,
      tenEdDt: tenEdDt ?? this.tenEdDt,
      genDen: genDen ?? this.genDen,
      brdLtQty: brdLtQty ?? this.brdLtQty,
      sellVarM: sellVarM ?? this.sellVarM,
      delStDt: delStDt ?? this.delStDt,
      nav: nav ?? this.nav,
      combSym: combSym ?? this.combSym,
      trdSym: trdSym ?? this.trdSym,
      navDt: navDt ?? this.navDt,
      noMkPro: noMkPro ?? this.noMkPro,
      cmpName: cmpName ?? this.cmpName,
      pmtdToTrade: pmtdToTrade ?? this.pmtdToTrade,
      exprMrgn: exprMrgn ?? this.exprMrgn,
      mktPro: mktPro ?? this.mktPro,
      sipSec: sipSec ?? this.sipSec,
      unqKey: unqKey ?? this.unqKey,
      strkPrc: strkPrc ?? this.strkPrc,
      warn: warn ?? this.warn,
      defMkt: defMkt ?? this.defMkt,
      recDt: recDt ?? this.recDt,
      buyVarMrgn: buyVarMrgn ?? this.buyVarMrgn,
      prcNum: prcNum ?? this.prcNum,
      maxQty: maxQty ?? this.maxQty,
      lotSz: lotSz ?? this.lotSz,
      desc: desc ?? this.desc,
      prcDen: prcDen ?? this.prcDen,
      mfAmt: mfAmt ?? this.mfAmt,
      exEndDt: exEndDt ?? this.exEndDt,
      asstCd: asstCd ?? this.asstCd,
      dscQty: dscQty ?? this.dscQty,
      clsEnd: clsEnd ?? this.clsEnd,
      sym: sym ?? this.sym,
      crpActn: crpActn ?? this.crpActn,
      instTyp: instTyp ?? this.instTyp,
      expDt: expDt ?? this.expDt,
      exStrDt: exStrDt ?? this.exStrDt,
      exprDt: exprDt ?? this.exprDt,
      thrtPrc: thrtPrc ?? this.thrtPrc,
      idxId: idxId ?? this.idxId,
      lPrcRng: lPrcRng ?? this.lPrcRng,
      matrDt: matrDt ?? this.matrDt,
      tok: tok ?? this.tok,
      hPrcRng: hPrcRng ?? this.hPrcRng,
      delUnits: delUnits ?? this.delUnits,
      maxOrdSz: maxOrdSz ?? this.maxOrdSz,
      seg: seg ?? this.seg,
      issRt: issRt ?? this.issRt,
      prcn: prcn ?? this.prcn,
      exchTokens: exchTokens ?? this.exchTokens,
      delEdDt: delEdDt ?? this.delEdDt,
      exSeg: exSeg ?? this.exSeg,
      crdtRtg: crdtRtg ?? this.crdtRtg,
      issCptl: issCptl ?? this.issCptl,
      tenStDt: tenStDt ?? this.tenStDt,
      optType: optType ?? this.optType,
      tckSz: tckSz ?? this.tckSz,
      series: series ?? this.series,
      exch: exch ?? this.exch,
      inst: inst ?? this.inst,
      sptPrc: sptPrc ?? this.sptPrc,
      clsStrt: clsStrt ?? this.clsStrt,
      modfr: modfr ?? this.modfr,
      isin: isin ?? this.isin,
      minQty: minQty ?? this.minQty,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScripData &&
        other.issDt == issDt &&
        other.listDt == listDt &&
        other.ltDt == ltDt &&
        other.refKey == refKey &&
        other.admnDt == admnDt &&
        other.minRdQt == minRdQt &&
        other.multplr == multplr &&
        other.rmk == rmk &&
        other.expsnDt == expsnDt &&
        other.freeze == freeze &&
        other.genNum == genNum &&
        other.prcUnits == prcUnits &&
        other.instInf == instInf &&
        other.prcQuot == prcQuot &&
        other.updTime == updTime &&
        other.precFrt == precFrt &&
        other.tenEdDt == tenEdDt &&
        other.genDen == genDen &&
        other.brdLtQty == brdLtQty &&
        other.sellVarM == sellVarM &&
        other.delStDt == delStDt &&
        other.nav == nav &&
        other.combSym == combSym &&
        other.trdSym == trdSym &&
        other.navDt == navDt &&
        other.noMkPro == noMkPro &&
        other.cmpName == cmpName &&
        other.pmtdToTrade == pmtdToTrade &&
        other.exprMrgn == exprMrgn &&
        other.mktPro == mktPro &&
        other.sipSec == sipSec &&
        other.unqKey == unqKey &&
        other.strkPrc == strkPrc &&
        other.warn == warn &&
        other.defMkt == defMkt &&
        other.recDt == recDt &&
        other.buyVarMrgn == buyVarMrgn &&
        other.prcNum == prcNum &&
        other.maxQty == maxQty &&
        other.lotSz == lotSz &&
        other.desc == desc &&
        other.prcDen == prcDen &&
        other.mfAmt == mfAmt &&
        other.exEndDt == exEndDt &&
        other.asstCd == asstCd &&
        other.dscQty == dscQty &&
        other.clsEnd == clsEnd &&
        other.sym == sym &&
        other.crpActn == crpActn &&
        other.instTyp == instTyp &&
        other.expDt == expDt &&
        other.exStrDt == exStrDt &&
        other.exprDt == exprDt &&
        other.thrtPrc == thrtPrc &&
        other.idxId == idxId &&
        other.lPrcRng == lPrcRng &&
        other.matrDt == matrDt &&
        other.tok == tok &&
        other.hPrcRng == hPrcRng &&
        other.delUnits == delUnits &&
        other.maxOrdSz == maxOrdSz &&
        other.seg == seg &&
        other.issRt == issRt &&
        other.prcn == prcn &&
        other.delEdDt == delEdDt &&
        other.exSeg == exSeg &&
        other.crdtRtg == crdtRtg &&
        other.issCptl == issCptl &&
        other.tenStDt == tenStDt &&
        other.optType == optType &&
        other.tckSz == tckSz &&
        other.series == series &&
        other.exch == exch &&
        other.inst == inst &&
        other.sptPrc == sptPrc &&
        other.clsStrt == clsStrt &&
        other.modfr == modfr &&
        other.isin == isin &&
        other.minQty == minQty &&
        listEquals(other.exchTokens, exchTokens);
  }

  @override
  int get hashCode =>
      issDt.hashCode ^
      listDt.hashCode ^
      ltDt.hashCode ^
      refKey.hashCode ^
      admnDt.hashCode ^
      minRdQt.hashCode ^
      multplr.hashCode ^
      rmk.hashCode ^
      expsnDt.hashCode ^
      freeze.hashCode ^
      genNum.hashCode ^
      prcUnits.hashCode ^
      instInf.hashCode ^
      prcQuot.hashCode ^
      updTime.hashCode ^
      precFrt.hashCode ^
      tenEdDt.hashCode ^
      genDen.hashCode ^
      brdLtQty.hashCode ^
      sellVarM.hashCode ^
      delStDt.hashCode ^
      nav.hashCode ^
      combSym.hashCode ^
      trdSym.hashCode ^
      navDt.hashCode ^
      noMkPro.hashCode ^
      cmpName.hashCode ^
      pmtdToTrade.hashCode ^
      exprMrgn.hashCode ^
      mktPro.hashCode ^
      sipSec.hashCode ^
      unqKey.hashCode ^
      strkPrc.hashCode ^
      warn.hashCode ^
      defMkt.hashCode ^
      recDt.hashCode ^
      buyVarMrgn.hashCode ^
      prcNum.hashCode ^
      maxQty.hashCode ^
      lotSz.hashCode ^
      desc.hashCode ^
      prcDen.hashCode ^
      mfAmt.hashCode ^
      exEndDt.hashCode ^
      asstCd.hashCode ^
      dscQty.hashCode ^
      clsEnd.hashCode ^
      sym.hashCode ^
      crpActn.hashCode ^
      instTyp.hashCode ^
      expDt.hashCode ^
      exStrDt.hashCode ^
      exprDt.hashCode ^
      thrtPrc.hashCode ^
      idxId.hashCode ^
      lPrcRng.hashCode ^
      matrDt.hashCode ^
      tok.hashCode ^
      hPrcRng.hashCode ^
      delUnits.hashCode ^
      maxOrdSz.hashCode ^
      seg.hashCode ^
      issRt.hashCode ^
      prcn.hashCode ^
      exchTokens.hashCode ^
      delEdDt.hashCode ^
      exSeg.hashCode ^
      crdtRtg.hashCode ^
      issCptl.hashCode ^
      tenStDt.hashCode ^
      optType.hashCode ^
      tckSz.hashCode ^
      series.hashCode ^
      exch.hashCode ^
      inst.hashCode ^
      sptPrc.hashCode ^
      clsStrt.hashCode ^
      modfr.hashCode ^
      isin.hashCode ^
      minQty.hashCode;
}
