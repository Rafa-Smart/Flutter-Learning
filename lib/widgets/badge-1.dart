import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  MyBadge({Key? key, required this.child, required this.value})
    : super(key: key);

  final Widget child;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 2,
          top: 2,
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.amberAccent,
              // color: color != null ? color : Theme.of(context).accentColor,
            ),
            constraints: BoxConstraints(minWidth: 16, minHeight: 16),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
