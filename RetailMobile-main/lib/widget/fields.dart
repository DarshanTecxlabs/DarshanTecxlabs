import 'package:flutter/material.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';

class TextInput extends TextFormField {
  TextInput(
      {String? labelText,
      String hintText = '',
      String helperText = '',
      TextInputType keyboardType = TextInputType.text,
      TextInputAction? textInputAction,
      TextEditingController? controller,
      bool? enabled,
      FormFieldValidator<String>? validator,
      Icon? suffixIcon,
      bool obscureText = false,
      FocusNode? focusNode,
      Function? onFieldSubmitted,
      bool autofocus = false,
      int maxLines = 1,
      int? maxLength})
      : super(
          maxLength: maxLength,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          controller: controller,
          enabled: enabled,
          validator: validator,
          obscureText: obscureText,
          cursorWidth: 1,
          cursorColor: black,
          decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(color: black),
              hintText: hintText,
              helperText: helperText,
              focusColor: black,
              suffixIcon: suffixIcon,
             border: OutlineInputBorder()
          ),
          focusNode: focusNode,
          //onFieldSubmitted: onFieldSubmitted!(),
          autofocus: autofocus,
          maxLines: maxLines,
        );
}

class PasswordInput extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String helperText;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final bool enabled;

  PasswordInput(
      {required this.labelText,
      required this.hintText,
      required this.helperText,
      required this.textInputAction,
      required this.controller,
      required this.enabled});

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextInput(
      labelText: widget.labelText,
      hintText: widget.hintText,
      helperText: widget.helperText,
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      enabled: widget.enabled,
      obscureText: _obscure,
      suffixIcon:  Icon(
          _obscure ? Icons.visibility : Icons.visibility_off,
          size: 20,
        ),
        //onPressed: () => setState(() => _obscure = !_obscure),

    );
  }
}
