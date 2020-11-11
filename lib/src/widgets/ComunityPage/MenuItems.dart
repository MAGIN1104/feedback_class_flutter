import 'package:flutter/material.dart';
import 'package:assets_img/src/pages/Constant.dart';
import 'package:assets_img/src/widgets/ComunityPage/Items.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Column(
          children: [
              Items(
              text: Text('Nuevo Grupo', style: kTextItem),
              // icon: FaIcon(FontAwesomeIcons.userCircle)
              icon: Icon(Icons.people_outline, ),
            ),
            Items(
              text: Text('Nuevo chat secreto', style: kTextItem), 
              icon: Icon(Icons.lock_outline)),
            Items(
              text: Text('Nuevo canal', style: kTextItem,), 
              icon: Icon(Icons.voice_chat,)),
            Items(
              text: Text('Contactos', style: kTextItem), 
              icon: Icon(Icons.perm_identity,)),
            Items(
              text: Text('Llamadas', style: kTextItem), 
              icon: Icon(Icons.phone,)),
            Items(
              text: Text('Mensajes Guardados', style: kTextItem), 
              icon: Icon(Icons.bookmark_border,)),
            Items(
              text: Text('Ajustes', style: kTextItem), 
              icon: Icon(Icons.settings,)),
            Divider(),
            Items(
              text: Text('Invitar Amigos', style: kTextItem), 
              icon: Icon(Icons.person_add)),
            Items(
              text: Text('Preguntas Frecuentes', style: kTextItem), 
              icon: Icon(Icons.help_outline)),
          ],
        ),
      ),
    );
  }
}
