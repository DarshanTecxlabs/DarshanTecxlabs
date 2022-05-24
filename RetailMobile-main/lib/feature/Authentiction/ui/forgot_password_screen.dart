import 'package:flutter/material.dart';
import 'package:tecxlabs_trading_app/feature/Authentiction/ui/forgot_password_form.dart';
import 'package:tecxlabs_trading_app/repository/user_repository.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final UserRepositories userRepositories;

  const ForgotPasswordScreen({Key? key, required this.userRepositories})
      : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgotPasswordForm(userRepositories: widget.userRepositories),
    );
  }
}
