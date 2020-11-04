import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:assets_img/src/pages/Constant.dart';

class DetailsWD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppbar(),
          SliverList(
              delegate:
                  SliverChildListDelegate(
                    [SizedBox(height: 20.0),
                     _details(wd_details),
                     _image('assets/img/webdesign.jpg'),
                     _details(wd_details2),
                    ]
                  )
          )
        ],
      ),
    );
  }

  Widget _crearAppbar() {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: kMoradoColor,
      expandedHeight: 200.0,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('WEB DESIGN',
            style: TextStyle(color: Colors.white, fontSize: 16.0)),
            background: Hero(tag: 'tag1', child: Image.asset('assets/img/wd.jpg',fit: BoxFit.cover,)))
    );
  }

  Widget _details(String detail) {
    return Container(
      padding: EdgeInsets.only(left:20.0, right: 20.0, bottom: 30.0),
      child: Text(
        detail,
        textAlign: textoCentrado,
        style: TextStyle(
          fontSize: 15.0
        )
      ),
    );
  }
  Widget _image(String imagen){
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0), 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(imagen, fit: BoxFit.fill,)
      )
    );
  }
}
