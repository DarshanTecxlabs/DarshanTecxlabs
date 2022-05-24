import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:tecxlabs_trading_app/common/data/models/interactive_api_response.dart';
import 'package:tecxlabs_trading_app/common/network/executer.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/holdingresponsemodel.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/holdings_model.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/position_model.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/repositories/portfolio_repository.dart';

class IPortfolioRepo extends PortfolioRepo {
  final Executer executer;

  IPortfolioRepo({required this.executer});

  @override
  Future<Either<String, List<Holding>>> getAllHoldings() async {
    List<Holding> lstholding = [];
    String jsonResponse = await executer.getHoldings();
    final response = HoldingResponse.fromJson(jsonDecode(jsonResponse));
    if (response.stCode == 200) {
      if (response.hldVal is List) {
        response.hldVal.forEach((e) {
          lstholding.add(Holding.fromJson(e));
        });
      }
      return Right(lstholding);
    } else {
      return Left("No Holdings Data");
    }
  }

  @override
  Future<Either<String, List<Position>>> getAllPositions() async {
    List<Position> lstPositions = [];
    String jsonResponse = await executer.getPositions();
    final response = InteractiveAPIResponse.fromJson(jsonDecode(jsonResponse));
    if (response.stCode == 200) {
      if (response.data is List) {
        response.data.forEach((e) {
          lstPositions.add(Position.fromJson(e));
        });
      }
      return Right(lstPositions);
    } else {
      return Left("No Position Data");
    }
  }
}
