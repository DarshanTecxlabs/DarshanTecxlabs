class ContractSearchReq {
  late String? search_type;
  late String? keyword;
  // ignore: non_constant_identifier_names
  late List<String>? allowed_exchange;

  Map<String, dynamic> toJson() => {
        'search_type': search_type,
        'keyword': keyword,
        'allowed_exchange': allowed_exchange
      };
}
