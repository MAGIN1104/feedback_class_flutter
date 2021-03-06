import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Items extends StatelessWidget {
  Items({@required this.text, @required this.icon, this.faicon, this.ontap});
  final Text text;
  final FaIcon faicon;
  final Icon icon;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      trailing: Icon(Icons.arrow_forward_ios),
      title: text,
      onTap: ontap,
    );
  }
}
