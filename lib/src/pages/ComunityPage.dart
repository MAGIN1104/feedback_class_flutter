import 'package:assets_img/src/pages/Constant.dart';
import 'package:assets_img/src/widgets/ComunityPage/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ComunityPage extends StatefulWidget {
  @override
  _ComunityPageState createState() => _ComunityPageState();
}

class _ComunityPageState extends State<ComunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //DRAWER
        drawer: DDrawer(),

        //CONTENIDO
        body: CustomScrollView(
          slivers: [
            _crearAppBar(),
            SliverList(
                delegate: SliverChildListDelegate([
              _details(kwd_com),
              _details(kwd_com),
              _details(kwd_com),
              _details(kwd_com),
              _cardImage(),
              _details(kwd_com),
              _details(kwd_com),
              _details(kwd_com),
            ]))
          ],
        ));
  }

  Widget _crearAppBar() {
    return SliverAppBar(
        elevation: 2.0,
        backgroundColor: Color(0xff353534),
        expandedHeight: 200.0,
        floating: true,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('WeDevs Comunity',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            background: Image.asset(
              'assets/img/wedevs.png',
              fit: BoxFit.cover,
            )));
  }

  Widget _details(String detail) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Text(detail,
          textAlign: textoCentrado, style: TextStyle(fontSize: 15.0)),
    );
  }

  Widget _cardImage() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 2), blurRadius: 5.0)
          ],
          // color: Color(0xff1d1e33),
      ),
      width: double.infinity,
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            child: Image.asset('assets/img/wedevs.png', fit: BoxFit.cover,)
          ),
          SizedBox(height: 10.0,),

          //RATING_BAR
          RatingBar.builder(
              initialRating: 5,
              minRating: 1,
              itemSize: 30.0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
              itemBuilder: (context, _) => 
              FaIcon(FontAwesomeIcons.solidHeart, color: Colors.red,),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
       ],
      ),
    );
  }
}
