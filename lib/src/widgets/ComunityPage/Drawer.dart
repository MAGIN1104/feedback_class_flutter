import 'package:assets_img/src/pages/Constant.dart';
import 'package:assets_img/src/widgets/ComunityPage/MenuItems.dart';
import 'package:flutter/material.dart';

class DDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff353534)
              // color: kMoradoColor
              // color: Color(0xff517da2)
            ),
            child:Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 30,
                          child: Text('M', style: TextStyle(fontSize: 30.0)),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Magin Luna', style: TextStyle(color: Colors.white),),
                              Text('+591 67084403',style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
            ) 
          ),
          MenuItem()
        ],
      ),
    );
  }
}
