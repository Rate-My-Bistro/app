import 'package:flutter/material.dart';

/// Widget that wraps a another component
/// that is put above another backlayer
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
class FrontLayer extends StatelessWidget {
  const FrontLayer({
    Key key,
    this.onTap,
    this.child,
    this.shouldHideGestures,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget child;
  final Function shouldHideGestures;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(46.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          shouldHideGestures()
              ? Expanded(child: child)
              : GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onTap,
                  child: Container(
                    height: 40.0,
                    alignment: AlignmentDirectional.centerStart,
                  ),
                ),
        ],
      ),
    );
  }
}
