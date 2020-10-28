import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:assets_img/src/pages/Constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Creamos variable inicializando en 0 que nos servira para la parte de los bottomtab
  int _seleccionado = 0;

  //Nos creamos una lista de opciones del menu del bottomtab
  List<Widget> _opciones = <Widget>[
    Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _HeaderCurvaPainter(),
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
                    fontFamily: 'Lato',
                    color: Colors.black),
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: CardReusable(
                    card: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset('assets/img/flutter.png',fit: BoxFit.cover,))
                  )),
                  Expanded(child: CardReusable(
                     card: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset('assets/img/webdesign.jpg',fit: BoxFit.cover,))
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: CardReusable(
                     card: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset('assets/img/unreal.png',fit: BoxFit.cover,))
                  )),
                  Expanded(child: CardReusable(
                     card: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset('assets/img/angular.png',fit: BoxFit.cover,))
                  )),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
    Text('Opcion 1'),
    Text('Opcion 2'),
    Text('Opcion 2'),
    Text('Opcion 2')
  ];

  //se crea un metodo para la seleccion de opciones
  void _selectedOption(int index) {
    setState(() {
      _seleccionado = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //en el body se inicializa con un container que como hijo recibira las opciones del menu que seleccionesmos
      body: Container(child: _opciones.elementAt(_seleccionado)),
      //el Scaffold recibe una propiedad que es el BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
      //definimos las opciones del menu que se requiera
        type : BottomNavigationBarType.fixed,    //en el caso de que se tenga mas de 3 opciones utilizar este comando
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.university),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.addressCard),
            label: 'Comunity',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userFriends),
            label: 'Tutors',
          ),
           BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userFriends),
            label: 'Tutors',
          ),
           BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userFriends),
            label: 'Tutors',
          ),
        ],
        currentIndex: _seleccionado,
        selectedItemColor: kMoradoColor,
        onTap: _selectedOption,
      ),
    );
  }
}

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

class _HeaderCurvaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = kMoradoColor;
    //Que tipo de relleno queremos
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = new Path();

    //Dibujamos el path y el lapiz
    // path.moveTo(0, size.height * 0.4);
    // path.lineTo(size.width, size.height * 0.5);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    //Curvas
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.20, size.width, size.height * 0.30);
    // path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
