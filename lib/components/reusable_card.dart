import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget { //stateless widgets are immutable
  ReusableCard ({ @required this.colours, this.cardChild, this.onPress});
  final Color colours;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Color(0xFF1D1E33),
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}
//const cannot be change at runtime its compile time constant
//whereas final is not runtime constant