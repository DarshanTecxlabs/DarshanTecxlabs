import 'package:flutter/material.dart';
import 'package:tecxlabs_trading_app/feature/Authentiction/ui/pin_form.dart';

class PinLoginScreen extends StatefulWidget {
  @override
  _PinLoginScreenState createState() => _PinLoginScreenState();
}

class _PinLoginScreenState extends State<PinLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MPinForm(),
    );
  }
}
