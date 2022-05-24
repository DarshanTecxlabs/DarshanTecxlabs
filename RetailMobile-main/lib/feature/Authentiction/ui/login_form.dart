import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';
import 'package:tecxlabs_trading_app/common/utils/const.dart';
import 'package:tecxlabs_trading_app/feature/Authentiction/bloc/login/login_bloc.dart';
import 'package:tecxlabs_trading_app/util/app_router.dart';
import 'package:tecxlabs_trading_app/util/image_helper.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _uidController;
  late TextEditingController _pwdController;

  @override
  void initState() {
   
    _uidController = TextEditingController(text: kReleaseMode?'':'RP001-TECXLABS');
    _pwdController = TextEditingController(text: kReleaseMode?'':'abc@1234');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
          _uidController.text,
          md5.convert(utf8.encode(_pwdController.text)).toString(),
          brokerId,
          deviceInfo,
          source,
          '',
          ''));
    }

    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailure) {
        print('Login Failed');
      }
      if (state is LoginSuccess) {
        Navigator.pushReplacementNamed(context, Routes.pinScreen);
        print('Login Success');
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return SafeArea(
          maintainBottomViewPadding: true,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(30),
                  vertical: ScreenUtil().setHeight(30)),
              height: ScreenUtil().screenHeight,
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///top section
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
                      child: Text('Login',
                          style: GoogleFonts.openSans(
                            fontSize: ScreenUtil().setSp(35),
                            color: purpleishBlue,
                            fontWeight: FontWeight.bold,
                          )),
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

                    ///middle section
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(5)),
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().setHeight(45),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.characters,
                        controller: _uidController,
                        style: GoogleFonts.openSans(
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(5),
                              left: ScreenUtil().setWidth(8)),
                          suffixIcon: Icon(Icons.mail_outline_rounded),
                          hintText: '',
                          labelText: 'User Id',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(ScreenUtil().radius(7)),
                            borderSide: BorderSide(
                              color: lightPeriwinkle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(30),
                          horizontal: ScreenUtil().setWidth(5)),
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().setHeight(45),
                      child: TextFormField(
                        controller: _pwdController,
                        style: GoogleFonts.openSans(
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w700),
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(5),
                              left: ScreenUtil().setWidth(8)),
                          suffixIcon: Icon(Icons.lock_outline_rounded),
                          hintText: '',
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(ScreenUtil().radius(7)),
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
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().setHeight(50),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          ScreenUtil().radius(7)),
                                      side: BorderSide(color: purpleishBlue))),
                          backgroundColor:
                              MaterialStateProperty.all(purpleishBlue),
                        ),
                        onPressed: () {
                          _onLoginButtonPressed();
                        },
                        child: Text(
                          'LOGIN',
                          style: GoogleFonts.openSans(
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.openSans(
                            color: purpleishBlue,
                            fontSize: ScreenUtil().setSp(13),
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    ///bottom section
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(79)),
                      child: RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account?',
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.normal),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Register Here',
                                  style: GoogleFonts.openSans(
                                      color: purpleishBlue,
                                      fontSize: ScreenUtil().setSp(16),
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // navigate to desired screen
                                    })
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }

// _onLoginButtonPressed() {
//   BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
//       // Constants.deviceInfo, "", "",
//       // uid: _uidController.text,
//       // pwd: md5.convert(utf8.encode(_pwdController.text)).toString(),
//       // brokerId: Constants.brokerId, source: Constants.source,
//   ));

}
