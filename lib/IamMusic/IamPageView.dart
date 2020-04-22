import 'dart:developer';

import 'package:dribble_1/IamMusic/CDCover.dart';
import 'package:flutter/material.dart';

class IamPageView extends StatefulWidget {
  IamPageView({Key key, this.list}) : super(key: key);
  final List list;
  @override
  _IamPageViewState createState() => _IamPageViewState();
}

class _IamPageViewState extends State<IamPageView>
    with TickerProviderStateMixin {
  PageController _pvController;
  List<double> _animations = [];
  AnimationController _animationController;
  List<String> _imagePaths = [
    'assets/queen.jpg',
    'assets/slow_rush.jpg',
    'assets/origins.jpg',
    'assets/blue.jpg',
  ];
  List<List<String>> _trackNames = [
    ['Scandal', 'The Miracle', 'Queeen'],
    ['Borderline', 'The Slow Rush', 'Tame Impala'],
    ['Machine', 'Origins', 'Imagine Dragons'],
    ['I\'m blue', 'Blue (Da Ba Dee)', 'Eiffel 65']
  ];
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _pvController = PageController(viewportFraction: 0.6);
    var i = 0.0;
    widget.list.forEach((_) {
      _animations.add(i);
      i = i + 1;
    });
    _pvController.addListener(() {
      _currentPage = _pvController.page.ceil();
      _animations[_currentPage] = _pvController.page - _currentPage;
      if (_currentPage > 0) {
        _animations[_currentPage - 1] = 1 - (_currentPage - _pvController.page);
      }
      _animationController.value = _currentPage - _pvController.page;
      log(_animationController.value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      pageSnapping: true,
      controller: _pvController,
      itemCount: widget.list.length,
      itemBuilder: (context, i) {
        return LayoutBuilder(
          builder: (context, BoxConstraints cons) {
            return AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 16) +
                        (EdgeInsets.all(1) * (50 * _animations[i]).abs()),
                    //padding: EdgeInsets.all(16),
                    width: cons.maxWidth / 2,
                    height: cons.maxHeight,
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 20,
                              color: Colors.grey[800].withAlpha(50))
                        ]),
                    child: LayoutBuilder(
                        builder: (context, BoxConstraints constraints) {
                      return Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(16),
                            height: constraints.maxHeight * .7,
                            child: CDCover(
                              value: _animations[i].abs(),
                              imagePath: _imagePaths[i],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16),
                            alignment: Alignment.centerLeft,
                            height: constraints.maxHeight * .15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _trackNames[i][1],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: constraints.maxHeight * .05,
                                  ),
                                ),
                                Text(
                                  _trackNames[i][2],
                                  style: TextStyle(
                                    fontSize: constraints.maxHeight * .05,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: constraints.maxHeight * .15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: constraints.maxHeight * .2,
                                  width: constraints.maxHeight * .2,
                                  alignment: Alignment.center,
                                  child: Icon(Icons.favorite_border,size: constraints.maxHeight*.09,),
                                ),
                                Container(
                                  height: constraints.maxHeight * .2,
                                  width: constraints.maxHeight * .2,
                                  decoration: BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(32),
                                      topLeft: Radius.circular(16),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(Icons.add,color: Colors.grey[50],),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }),
                  );
                });
          },
        );
      },
    );
  }
}
