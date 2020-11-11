import 'package:assets_img/src/pages/ComunityPage.dart';
import 'package:assets_img/src/pages/TutorsPage.dart';
import 'package:assets_img/src/pages/CoursesPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assets_img/src/pages/Constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  //Creamos variable inicializando en 0 que nos servira para la parte de los bottomtab
  int _seleccionado = 0;
  
  @override
  Widget build(BuildContext context) {
    //Nos creamos una lista de opciones del menu del bottomtab
    List<Widget> _opciones = <Widget>[
      CoursesPage(),
      ComunityPage(),
      TutorsPage(),
    ];

    //se crea un metodo para la seleccion de opciones
    void _selectedOption(int index) {
      setState(() {
        _seleccionado = index;
      });
    }

    return Scaffold(
      //en el body se inicializa con un container que como hijo recibira las opciones del menu que seleccionesmos
      body: Container(child: _opciones.elementAt(_seleccionado)),
      //el Scaffold recibe una propiedad que es el BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        //definimos las opciones del menu que se requiera
        type: BottomNavigationBarType
            .fixed, //en el caso de que se tenga mas de 3 opciones utilizar este comando
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.university),
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
        ],
        currentIndex: _seleccionado,
        selectedItemColor: kMoradoColor,
        onTap: _selectedOption,
      ),
    );
  }
}
