import 'package:dartz/dartz.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/holdings_model.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/position_model.dart';

abstract class PortfolioRepo {
  Future<Either<String, List<Holding>>> getAllHoldings();
  Future<Either<String, List<Position>>> getAllPositions();
}
