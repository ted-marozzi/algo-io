import 'package:algo_io_files/util/sort_model.dart';
import 'package:flutter/material.dart';

class SortWidget extends StatelessWidget {


  const SortWidget({
    Key key,
    @required this.number,
    @required this.index,
    @required this.containerWidth,
  })  : assert(number != null && index != null),
        assert(index >= 0),
        super(key: key);

  final SortModel number;
  final int index;
  final int paddingInBetween = 10;
  final int paddingTop = 30;
  final double widgetSize = 50;
  final double containerWidth;
  final double radius = 10;

  Offset _getPosition() {

    return Offset(
        (containerWidth-widgetSize)/2,
        ( widgetSize + paddingInBetween )* index + paddingTop
    );
  }

  @override
  Widget build(BuildContext context) {
    final offset = _getPosition();//use mid x and  index

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 2250),
      curve: Curves.elasticOut,
      left: offset.dx,
      top: offset.dy,
      child: SizedBox(
        width: widgetSize,
        height: widgetSize,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.white24,
              borderRadius: BorderRadius.all(Radius.circular(radius))
          ),

          child: Center(
            child: Text(
              number.value.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}