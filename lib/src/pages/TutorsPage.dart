import 'package:assets_img/src/pages/Constant.dart';
import 'package:flutter/material.dart';

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
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: 'Magin',),
              Tab(icon: Icon(Icons.directions_transit), text:'Cristian'),
              Tab(icon: Icon(Icons.directions_bike), text: 'Oso'),
            ],
          ),
          title: Text('TUTORES'),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
