import 'package:assets_img/src/pages/Constant.dart';
import 'package:assets_img/src/widgets/HomePage/CardReusable.dart';
import 'package:assets_img/src/widgets/HomePage/HeaderPainter.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: HeaderCurvaPainter(),
          ),
        ),
        Column(
          children: [
            Expanded(
                child: Center(
              child: Text(
                'Hi, Magin',
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
            Container(
                height: 25.0,
                child: Center(
                  child: Text(
                    'Courses within the community',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        //fuente que le asignamos por medio de los assets
                        fontFamily: 'Lato',
                        color: Colors.black),
                  ),
                )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      /*
                      Envolvemos el CardReusable en un GestureDetector
                      con el fin de poder captar un ontap para realizar la 
                      navegacion entre rutas.
                    */
                      child: GestureDetector(
                    onTap: () {
                      /*
                        showDialog nos permitira mostrar el alertDialog que nosotros 
                        mismos los diseñamos.
                      */

                      showDialog(
                          context: context,
                          builder: (_) => _alertDialog(context));
                    },
                    child: CardReusable(
                        card: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/img/flutter.png',
                                fit: BoxFit.cover))),
                  )),
                  Expanded(
                    child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'detailsWD');
                    },
                    child: Hero(
                      tag: 'tag1',
                      child: CardReusable(
                          card: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('assets/img/wd.jpg',
                                  fit: BoxFit.cover))),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      print('Juegos...!');
                    },
                    child: CardReusable(
                        card: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/img/unreal.png',
                                fit: BoxFit.cover))),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      print('Angular...!');
                    },
                    child: CardReusable(
                        card: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/img/angular.png',
                              fit: BoxFit.cover,
                            ))),
                  )),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _alertDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Flutter'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/img/flutter.png'),
          SizedBox(height: 20.0),
          Text(flutter_body, textAlign: textoCentrado)
        ],
      ),
      actions: [
        FlatButton(
            onPressed: () => Navigator.of(context).pop(), child: Text('OK'))
      ],
    );
  }
}
