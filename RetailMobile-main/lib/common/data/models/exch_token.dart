class ExchToken {
  final String? ex;
  final String? tk;
  final String? es;
  final String? ts;

  const ExchToken({this.ex, this.tk, this.es, this.ts});

  @override
  String toString() => 'ExchToken(ex: $ex, tk: $tk, es: $es, ts: $ts)';

  factory ExchToken.fromJson(Map<String, dynamic> json) => ExchToken(
        ex: json['ex'] as String?,
        tk: json['tk'] as String?,
        es: json['es'] as String?,
        ts: json['ts'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ex': ex,
        'tk': tk,
        'es': es,
        'ts': ts,
      };

  ExchToken copyWith({
    String? ex,
    String? tk,
    String? es,
    String? ts,
  }) {
    return ExchToken(
      ex: ex ?? this.ex,
      tk: tk ?? this.tk,
      es: es ?? this.es,
      ts: ts ?? this.ts,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExchToken &&
        other.ex == ex &&
        other.tk == tk &&
        other.es == es &&
        other.ts == ts;
  }

  @override
  int get hashCode => ex.hashCode ^ tk.hashCode ^ es.hashCode ^ ts.hashCode;
}
