import 'package:aub/Models/DataModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aub/Services/DataService.dart';
import 'package:aub/Pages/DetailPage.dart';

class Cover2 extends StatefulWidget {


  const Cover2({
    Key key,
    @required this.text,
    @required this.onTap,
    this.onFocus,
    this.image,
  }) : super(key: key);

  final String image;
  final String text;
  final Function onTap;
  final Function onFocus;

  @override
  _Cover2State createState() => _Cover2State();
}

class _Cover2State extends State<Cover2> with SingleTickerProviderStateMixin {
  FocusNode _node;
  AnimationController _controller;
  Animation<double> _animation;
  int _focusAlpha = 100;

  Widget image;

  @override
  void initState() {
    _node = FocusNode();
    _node.addListener(_onFocusChange);
    _controller = AnimationController(
        duration: const Duration(milliseconds: 100),
        vsync: this,
        lowerBound: 0.9,
        upperBound: 1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _node.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_node.hasFocus) {
      _controller.forward();
      if (widget.onFocus != null) {
        widget.onFocus();
      }
    } else {
      _controller.reverse();
    }
  }

  void _onTap() {
    _node.requestFocus();
    if (widget.onTap != null) {
      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: _onTap,
      focusNode: _node,
      focusColor: Colors.transparent,
      focusElevation: 0,
      child: buildCover2(context),
    );
  }

  Widget buildCover2(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: _onTap,
        child: Column(
          children: <Widget>[
            Container(
              child: Image(image: AssetImage(widget.image)),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(_focusAlpha),
                  blurRadius: 15,
                  offset: Offset(10, 15),
                )
              ]),
            ),
            Align(
              child: Text(
                widget.text,
                maxLines: 2,
                style: TextStyle(color: Colors.white),
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
