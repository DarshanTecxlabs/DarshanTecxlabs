import 'package:equatable/equatable.dart';

class ContractSearch extends Equatable {
  final String? omexs;
  final String? omtkn;
  final String? cnam;
  final String? tsym;
  final String? exseg;
  final String? uomtkn;
  final String? expry;
  final String? optyp;
  final String? strikprc;
  final String? stktyp;
  final String? seris;
  final String? symdes;
  final String? usym;
  final String? wgt;
  final dynamic last;
  final dynamic pchng;
  final dynamic chng;
  final String? time;
  final dynamic vol;

  const ContractSearch(
      {this.omtkn,
      this.cnam,
      this.tsym,
      this.exseg,
      this.uomtkn,
      this.expry,
      this.optyp,
      this.strikprc,
      this.stktyp,
      this.seris,
      this.symdes,
      this.usym,
      this.wgt,
      this.last,
      this.pchng,
      this.chng,
      this.time,
      this.vol,
      this.omexs});

  factory ContractSearch.fromJson(Map<String, dynamic> json) => ContractSearch(
        omexs: json['omexs'] as String?,
        omtkn: json['omtkn'] as String?,
        cnam: json['cnam'] as String?,
        tsym: json['tsym'] as String?,
        exseg: json['exseg'] as String?,
        uomtkn: json['uomtkn'] as String?,
        expry: json['expry'] as String?,
        optyp: json['optyp'] as String?,
        strikprc: json['strikprc'] as String?,
        stktyp: json['stktyp'] as String?,
        seris: json['seris'] as String?,
        symdes: json['symdes'] as String?,
        usym: json['usym'] as String?,
        wgt: json['wgt'] as String?,
        last: json['last'] as dynamic,
        pchng: json['pchng'] as dynamic,
        chng: json['chng'] as dynamic,
        time: json['time'] as String?,
        vol: json['vol'] as dynamic,
      );

  @override
  List<Object?> get props => [
        this.omtkn,
        this.cnam,
        this.tsym,
        this.exseg,
        this.uomtkn,
        this.expry,
        this.optyp,
        this.strikprc,
        this.stktyp,
        this.seris,
        this.symdes,
        this.usym,
        this.wgt,
        this.last,
        this.pchng,
        this.chng,
        this.time,
        this.vol,
        this.omexs
      ];
}
