import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tecxlabs_trading_app/common/ui/appbar/widgets/clip.dart';

class GradientAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? bottom;
  final bool pullDown;

  const GradientAppBar({
    Key? key,
    this.title,
    this.bottom,
    this.pullDown = false,
  }) : super(key: key);
  @override
  _GradientAppBarState createState() => _GradientAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(150);
}

class _GradientAppBarState extends State<GradientAppBar> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var linearGradient = LinearGradient(colors: [
      Theme.of(context).primaryColor,
      Theme.of(context).accentColor
    ]);
    return ClipPath(
      clipper: CustomShape(),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          gradient: linearGradient,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(width * 1.9, 100),
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.menu),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                        Text(
                          widget.title ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    if (widget.pullDown)
                      IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.chevronDown),
                        color: Colors.white,
                        iconSize: 30,
                      )
                  ],
                ),
                widget.bottom ??
                    Container(
                      height: 25,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
