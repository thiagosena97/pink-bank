import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto/models/user.dart';
import 'package:projeto/screens/menu/menu_bank.dart';
import 'package:projeto/services/auth_service.dart';

class LoginForm extends StatefulWidget {
  static String tag = 'login-page';

  _LoginState createState() => _LoginState();

}

class _LoginState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {

    final TextEditingController _email = TextEditingController();
    final TextEditingController _senha = TextEditingController();

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/logo-bank.png'),
      ),
    );

    final email = TextFormField(
      controller: _email,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
    );

    final senha = TextFormField(
      controller: _senha,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Senha',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(16.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 8.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 46.0,
          onPressed: () => this.logar(_email, _senha),
          color: Colors.pink,
          child: Text('Acessar', style: TextStyle(color: Colors.white),),
        ),
      ),
    );

    final esqueceuLabel = FlatButton(child: Text(
      'Esqueci minha Senha', style: TextStyle(color: Colors.black54),),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0,right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0,),
            email,
            SizedBox(height: 8.0),
            senha,
            SizedBox(height: 24.0),
            loginButton,
            esqueceuLabel,
          ],
        ),
      ),
    );
  }

  void logar(TextEditingController email, TextEditingController senha) async{

    AuthService _auth = AuthService();

    try{

      User usuario = await _auth.singIn(email.text,senha.text);

      if(usuario.uid != null){

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Dashboard();
        }));

      }

    }catch(e){

    }

  }


}