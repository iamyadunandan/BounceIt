import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CD extends StatefulWidget {
  CD({Key key, this.image}) : super(key: key);
  final String image;

  @override
  _CDState createState() => _CDState();
}

class _CDState extends State<CD> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: constraints.maxWidth,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(widget.image),
              ),
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.grey[50],
                  width: 4,
                ),
              ),
            ),
          ),
          Container(
            height: constraints.maxWidth * 0.3,
            width: constraints.maxWidth * 0.3,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey[50]),
          )
        ],
      );
    });
  }
}

class CDCover extends StatefulWidget {
  CDCover({Key key, this.imagePath, this.value}) : super(key: key);
  final String imagePath;
  final double value;
  @override
  _CDCoverState createState() => _CDCoverState();
}

class _CDCoverState extends State<CDCover> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          LayoutBuilder(builder: (context, BoxConstraints cons) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: constraints.maxWidth * .7,
                  height: constraints.maxWidth * .7,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.imagePath),
                          fit: BoxFit.fitHeight),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3 * widget.value,
                            offset: Offset(2, 0),
                            color: Colors.grey[600]),
                      ]),
                ),
                Container(
                  width: constraints.maxWidth * 0.3 * (widget.value - 1).abs(),
                ),
              ],
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: constraints.maxWidth * 0.3 * (widget.value - 1).abs(),
              ),
              Container(
                width: constraints.maxWidth * .7,
                height: constraints.maxWidth * .7,
                child: Transform.rotate(
                  angle: pi * 2 * widget.value,
                  child: CD(
                    image: widget.imagePath,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: constraints.maxWidth * .7,
                height: constraints.maxWidth * .7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.imagePath),
                  ),
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.3 * (widget.value - 1).abs(),
              ),
            ],
          ),
        ],
      );
    });
  }
}
