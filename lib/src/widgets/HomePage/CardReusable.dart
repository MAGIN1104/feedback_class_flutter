import 'package:flutter/material.dart';


class CardReusable extends StatelessWidget {
  
  CardReusable({this.micolor, this.card});
  final Color micolor;
  Widget card;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 2), blurRadius: 2.0)
          ],
          // color: Color(0xff1d1e33),
          borderRadius: BorderRadius.circular(10.0)),
      height: 200.0,
      width: 170.0,
      child: card,
    );
  }
}
