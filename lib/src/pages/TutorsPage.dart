import 'package:flutter/material.dart';
import 'package:assets_img/src/pages/Constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TutorsPage extends StatefulWidget {
  @override
  _TutorsPageState createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMoradoColor,
          shadowColor: kMoradoColor,
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: FaIcon(FontAwesomeIcons.userSecret),text: 'Magin',),
              Tab(icon: FaIcon(FontAwesomeIcons.userGraduate), text:'Cristian'),
              Tab(icon: FaIcon(FontAwesomeIcons.paw), text: 'Oso'),
            ],
          ),
          title: Text('TUTORES'),
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton(
                      child:Icon(Icons.add),
                      onPressed: (){}
                    ),
                  ),
                ),
              ],
            ),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
