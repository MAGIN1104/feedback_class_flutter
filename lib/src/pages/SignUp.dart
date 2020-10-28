import 'package:assets_img/src/pages/Constant.dart';
import 'package:assets_img/src/providers/db_provider.dart';
import 'package:assets_img/src/widgets/LogIn/button.dart';
import 'package:assets_img/src/widgets/SignUp/headerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String texto = 'Register your data and be part of WeDevs';
  Widget espacio = SizedBox(height: 20.0);
  bool vstate = true;
  bool vstate2 = true;
  final _nameCont = TextEditingController();
  final _emailCont = TextEditingController();
  final _passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          children: [
            Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 100.0),
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Text(texto, style: ksubtittle, textAlign: TextAlign.center),
                    espacio,
                    _inputName(),
                    espacio,
                    _inputEmail(),
                    espacio,
                    _inputPass(),
                    espacio,
                    _inputConfirmPass(),
                    espacio,
                    Container(
                        height: 150.0,
                        child: SvgPicture.asset('assets/img/na.svg')),
                    SignInButtonWidget(
                      kcolor: Color(0XFF6C63FF),
                      ktext: 'Register',
                      kstyle: ktextbtnSingIn,
                      presionar: () async {
                        print(_nameCont.text);
                        print(_emailCont.text);
                        print(_passCont.text);
                        final userDB =await DBProvider.db.getUser(
                            _emailCont.text.trim(), 
                            _passCont.text.trim());
                        if (userDB == null) {
                          final respDB = await DBProvider.db.insertUser(
                              UserModel(
                                  name: _nameCont.text.trim(),
                                  email: _emailCont.text.trim(),
                                  pass: _passCont.text.trim()));
                          print(respDB);
                        } else {
                          print("El email ya existe");
                        }
                        // Navigator.pushNamed(context, '/');
                      },
                    ),
                  ],
                ))
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          width: double.infinity,
          child: HeaderSU(),
        ),
      ],
    ));
  }

  Widget _inputName() {
    return TextField(
      controller: _nameCont,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Color(0xff6C63FF)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff6C63FF)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff6C63FF)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Juanito Perez',
        labelText: 'Nombre Completo',
        icon: Icon(Icons.account_circle, color: Color(0xff6C63FF)),
      ),
    );
  }

  Widget _inputEmail() {
    return TextField(
      controller: _emailCont,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Color(0xff6C63FF)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff6C63FF)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff6C63FF)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'ejemplo@gmail.com',
        labelText: 'Email',
        icon: Icon(Icons.email, color: Color(0xff6C63FF)),
      ),
    );
  }

  Widget _inputPass() {
    return TextField(
      controller: _passCont,
      cursorColor: Color(0xff6C63FF),
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Color(0xff6C63FF)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6C63FF)),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6C63FF)),
            borderRadius: BorderRadius.circular(15.0),
          ),
          labelText: 'Contraseña',
          icon: Icon(
            Icons.vpn_key,
            color: Color(0xff6C63FF),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                vstate = !vstate;
              });
            },
            icon: vstate
                ? Icon(Icons.visibility_off, color: Color(0xff6C63FF))
                : Icon(Icons.visibility, color: Color(0xff6C63FF)),
          )),
      obscureText: vstate,
    );
  }

  Widget _inputConfirmPass() {
    Color kColor = Color(0xff6C63FF);
    return TextField(
      cursorColor: kColor,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: kColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          labelText: 'Confirmar contraseña',
          icon: Icon(
            Icons.vpn_key,
            color: kColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                vstate2 = !vstate2;
              });
            },
            icon: vstate2
                ? Icon(Icons.visibility_off, color: Color(0xff6C63FF))
                : Icon(Icons.visibility, color: Color(0xff6C63FF)),
          )),
      obscureText: vstate2,
    );
  }
}
