import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecxlabs_trading_app/feature/scrip/bloc/scrip_bloc.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/bloc/watchlist_bloc.dart';
import 'package:tecxlabs_trading_app/inject.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';
import 'package:tecxlabs_trading_app/feature/search/bloc/search_bloc.dart';
import 'package:tecxlabs_trading_app/util/app_router.dart';
import 'package:tecxlabs_trading_app/feature/orderbook/bloc/orderbook_bloc.dart';
import 'feature/Authentiction/bloc/authentication/auth_bloc.dart';
import 'feature/Authentiction/bloc/forgotPassword/forgot_password_bloc.dart';
import 'feature/Authentiction/bloc/login/login_bloc.dart';
import 'feature/Authentiction/bloc/mpin/mpin_bloc.dart';

import 'feature/portfolio_page/holdings/bloc/holdings_bloc.dart';
import 'feature/portfolio_page/positions/bloc/portfolio_bloc.dart';
import 'feature/watchlist/bloc/watchlist_bloc.dart';
import 'feature/web_socket/bloc/test_socket_bloc.dart';

void main() {
  inject();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => getIt<AuthenticationBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => getIt<LoginBloc>(),
        ),
        BlocProvider<MpinBloc>(
          create: (context) => getIt<MpinBloc>(),
        ),
        BlocProvider<ForgotPasswordBloc>(
          create: (context) => getIt<ForgotPasswordBloc>(),
        ),
        BlocProvider<TestSocketBloc>(
          create: (context) => TestSocketBloc(),
        ),
        // BlocProvider<ScripBloc>(
        //   create: (context) => ScripBloc(),
        // ),
        BlocProvider<WatchlistBloc>(
          create: (context) => WatchlistBloc(searchbloc: Searchbloc()),
        ),
        BlocProvider<OrderbookBloc>(
          create: (context) => OrderbookBloc(),
        ),
        BlocProvider<PortfolioBloc>(
          create: (context) => getIt<PortfolioBloc>(),
        ),
        BlocProvider<HoldingsBloc>(
          create: (context) => getIt<HoldingsBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(425, 812),
        builder: () => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: "OpenSans",
            primaryColor: purpleishBlue,
            accentColor: Color(0xffE000FF),
            primarySwatch: Colors.indigo,
            appBarTheme: AppBarTheme(
              brightness: Brightness.dark,
            ),
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: Routes.loginScreen,
        ),
      ),
    );
  }
}
