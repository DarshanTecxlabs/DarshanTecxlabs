import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';
import 'package:tecxlabs_trading_app/common/utils/const.dart';
import 'package:tecxlabs_trading_app/feature/Authentiction/bloc/forgotPassword/forgot_password_bloc.dart';
import 'package:tecxlabs_trading_app/feature/Authentiction/ui/login_screen.dart';
import 'package:tecxlabs_trading_app/repository/user_repository.dart';
import 'package:tecxlabs_trading_app/util/image_helper.dart';

class ForgotPasswordForm extends StatefulWidget {
  final UserRepositories userRepositories;

  const ForgotPasswordForm({Key? key, required this.userRepositories})
      : super(key: key);

  @override
  _ForgotPasswordFormState createState() =>
      _ForgotPasswordFormState(userRepositories);
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final UserRepositories userRepositories;

  _ForgotPasswordFormState(this.userRepositories);

  var _uidController = TextEditingController();
  var _mobileNumberController = TextEditingController();
  var _emailIdController = TextEditingController();
  var _panNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onSubmitButtonPressed() {
      BlocProvider.of<ForgotPasswordBloc>(context).add(SubmitButtonPressed(
          _uidController.text,
          _mobileNumberController.text,
          _emailIdController.text,
          _panNumberController.text,
          brokerId));
    }

    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
      if (state is ForgotPasswordFailure) {
        print('Failed');
      }
      if (state is ForgotPasswordSuccess) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
        print('Success');
      }
    }, child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
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
                      child: Text('Forgot Password',
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
                        controller: _uidController,
                        style: GoogleFonts.openSans(
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(5),
                              left: ScreenUtil().setWidth(8)),
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
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(30),
                          left: ScreenUtil().setWidth(5),
                          right: ScreenUtil().setWidth(5)),
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().setHeight(45),
                      child: TextFormField(
                        controller: _mobileNumberController,
                        style: GoogleFonts.openSans(
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(5),
                              left: ScreenUtil().setWidth(8)),
                          hintText: '',
                          labelText: 'Mobile Number',
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
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(30),
                          left: ScreenUtil().setWidth(5),
                          right: ScreenUtil().setWidth(5)),
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().setHeight(45),
                      child: TextFormField(
                        controller: _emailIdController,
                        style: GoogleFonts.openSans(
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(5),
                              left: ScreenUtil().setWidth(8)),
                          hintText: '',
                          labelText: 'Email Id',
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
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(30),
                          left: ScreenUtil().setWidth(5),
                          right: ScreenUtil().setWidth(5)),
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().setHeight(45),
                      child: TextFormField(
                        controller: _panNumberController,
                        style: GoogleFonts.openSans(
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(5),
                              left: ScreenUtil().setWidth(8)),
                          hintText: '',
                          labelText: 'Pan Number',
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
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(30),
                          left: ScreenUtil().setWidth(5),
                          right: ScreenUtil().setWidth(5)),
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
                          _onSubmitButtonPressed();
                        },
                        child: Text(
                          'SUBMIT',
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
    ));
  }
}
