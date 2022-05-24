import 'package:flutter/material.dart';

class CContainer extends StatelessWidget {
  final Widget child;

  const CContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey, width: 0.2),
          boxShadow: [
            BoxShadow(blurRadius: 4, spreadRadius: 2.9, color: Colors.grey.withOpacity(0.05))
          ]),
      child: child,
    );
  }
}
