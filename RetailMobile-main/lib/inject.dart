import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'package:tecxlabs_trading_app/feature/watchlist/data/repoitories/i_stock_repository.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/repoitories/stock_repository.dart';
import 'package:tecxlabs_trading_app/repository/user_repository.dart';

import 'common/network/executer.dart';
import 'feature/Authentiction/bloc/authentication/auth_bloc.dart';
import 'feature/Authentiction/bloc/forgotPassword/forgot_password_bloc.dart';
import 'feature/Authentiction/bloc/login/login_bloc.dart';
import 'feature/Authentiction/bloc/mpin/mpin_bloc.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/repositories/portfolio_repository.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/repositories/i_portfolio_repository.dart';

import 'feature/portfolio_page/holdings/bloc/holdings_bloc.dart';
import 'feature/portfolio_page/positions/bloc/portfolio_bloc.dart';


var getIt = GetIt.instance;

void inject() {
  getIt.registerLazySingleton<IScripRepository>(() => ScripRepository());
  getIt.registerFactory(() => AuthenticationBloc(userRepositories: getIt()));
  getIt.registerFactory(
      () => LoginBloc(authenticationBloc: getIt(), userRepositories: getIt()));
  getIt.registerFactory(() => MpinBloc(userRepositories: getIt()));
  getIt.registerFactory(() => ForgotPasswordBloc(userRepositories: getIt()));
  getIt.registerFactory(() => PortfolioBloc(repo: getIt()));
  getIt.registerFactory(() => HoldingsBloc(repo: getIt()));


  //----------------------------------------Repositories-------------------------------

  getIt.registerLazySingleton<UserRepositories>(() => UserRepositories());
  getIt.registerLazySingleton<PortfolioRepo>(() => IPortfolioRepo(executer: getIt()));

  //-----------------------------------------Singletons--------------------------------


  getIt.registerLazySingleton<Executer>(() => Executer());


}
