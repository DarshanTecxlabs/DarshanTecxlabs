import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';
import 'package:tecxlabs_trading_app/common/utils/const.dart';
import 'package:tecxlabs_trading_app/feature/Authentiction/bloc/login/login_bloc.dart';
import 'package:tecxlabs_trading_app/feature/Authentiction/bloc/mpin/mpin_bloc.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/bloc/watchlist_bloc.dart';
import 'package:tecxlabs_trading_app/util/app_router.dart';
import 'package:tecxlabs_trading_app/util/image_helper.dart';

class MPinForm extends StatefulWidget {
  @override
  _MPinFormState createState() => _MPinFormState();
}

class _MPinFormState extends State<MPinForm> {
  late TextEditingController _pinController;

  @override
  void initState() {
    // TODO: implement initState
    _pinController = TextEditingController(text: kReleaseMode?'':'1234');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _onMpinButtonPressed() {
      BlocProvider.of<MpinBloc>(context).add(MpinButtonPressed(
          context.read<LoginBloc>().getUID(),
          md5.convert(utf8.encode(_pinController.text)).toString(),
          brokerId,
          context.read<LoginBloc>().getloginResponse().data.devicempinkey,
          deviceInfo,
          source,
          '',
          ''));
    }

    return BlocListener<MpinBloc, MpinState>(
      listener: (context, state) {
        if (state is MpinFailure) {
          print('Mpin Failed');
        } else if (state is MpinSuccess) {
          BlocProvider.of<WatchlistBloc>(context).add(Load());
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushReplacementNamed(context, Routes.dashboardScreen);
          });
        }
      },
      child: BlocBuilder<MpinBloc, MpinState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(30),
                    vertical: ScreenUtil().setHeight(30)),
                height: ScreenUtil().screenHeight,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ///upper section
                      Container(
                        alignment: Alignment.topRight,
                        width: ScreenUtil().screenWidth,
                        child: Image.asset(
                          logo,
                          width: ScreenUtil().setWidth(90),
                          height: ScreenUtil().setHeight(50),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('Welcome, Tanmay',
                            style: GoogleFonts.openSans(
                              fontSize: ScreenUtil().setSp(25),
                              color: purpleishBlue,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('SH3528',
                            style: GoogleFonts.openSans(
                                fontSize: ScreenUtil().setSp(16),
                                color: purpleishBlue,
                                fontWeight: FontWeight.w600,
                                letterSpacing: ScreenUtil().setSp(0.16))),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(40)),
                        width: ScreenUtil().setWidth(301),
                        height: ScreenUtil().setHeight(226),
                        child: Image.asset(
                          loginasset,
                          fit: BoxFit.contain,
                        ),
                      ),

                      ///lower section
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10)),
                        width: ScreenUtil().screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: ScreenUtil().setWidth(248),
                              height: ScreenUtil().setHeight(45),
                              child: TextFormField(
                                obscureText: true,
                                controller: _pinController,
                                style: GoogleFonts.openSans(
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.w700,
                                    color: purpleishBlue),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(5),
                                      left: ScreenUtil().setWidth(8)),
                                  suffixIcon: Icon(Icons.password_outlined),
                                  hintText: '',
                                  labelText: 'PIN',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(7)),
                                    borderSide: BorderSide(
                                      color: lightPeriwinkle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(5)),
                                width: ScreenUtil().setWidth(46),
                                height: ScreenUtil().setHeight(45),
                                child: Image.asset(scanicon)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10),
                            vertical: ScreenUtil().setHeight(10)),
                        width: ScreenUtil().screenWidth,
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot PIN?',
                          style: GoogleFonts.openSans(
                              color: purpleishBlue,
                              fontSize: ScreenUtil().setSp(13),
                              fontWeight: FontWeight.bold,
                              letterSpacing: ScreenUtil().setSp(0.24)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(10),
                            horizontal: ScreenUtil().setWidth(10)),
                        width: ScreenUtil().screenWidth,
                        height: ScreenUtil().setHeight(50),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().radius(7)),
                                    side: BorderSide(color: purpleishBlue))),
                            backgroundColor:
                                MaterialStateProperty.all(purpleishBlue),
                          ),
                          onPressed: () {
                            _onMpinButtonPressed();
                          },
                          child: Text(
                            'CONTINUE',
                            style: GoogleFonts.openSans(
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
