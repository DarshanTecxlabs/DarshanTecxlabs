import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ImageWidget extends StatefulWidget {
  final String url;
  final num radius;
  final double border;

  const ImageWidget(
      {Key? key, required this.url, required this.radius, required this.border})
      : super(key: key);

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  _checkNetworkImage() async {
    try {
      var res = await get(Uri.parse(widget.url));
      if (res.statusCode == 404) {
        setState(() {
          _asset = true;
        });
      }
    } catch (e) {
      setState(() {
        _asset = true;
      });
    }
  }

  @override
  void initState() {
    _checkNetworkImage();
    super.initState();
  }

  bool _asset = false;
  @override
  Widget build(BuildContext context) {
    return Container();
    // return CircleAvatar(
    //     radius: widget.radius + widget.border,
    //     backgroundColor: Theme.of(context).primaryColor,
    //     child: CircleAvatar(
    //         radius: widget.radius.toDouble(),
    //         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //         backgroundImage: (_asset)
    //             ? AssetImage("assets/png/no-image.png") as ImageProvider<Object>
    //             : NetworkImage(widget.url)));
  }
}
