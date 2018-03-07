import 'package:flutter/material.dart';
import 'package:placements/global.dart';


class LoginComponent extends StatefulWidget {
  static final routeName = "/login"; 
  @override
  LoginComponentState createState() => new LoginComponentState();
}

class LoginComponentState extends State<LoginComponent> {

  @override
  Widget build(BuildContext context){
    AppService.context = context;
    
    return new Container(
      decoration: new BoxDecoration( color: Colors.blue),
      child: new Center(
        
        child:
        new Container(
          padding: new EdgeInsets.all(40.0),
          height: 320.0,
        child: new Card(
          elevation: 10.0,
          child: new Padding(
          padding: new EdgeInsets.all(10.0),            
          child :new ListView(
            children: <Widget>[
              new ListTile(title:
                new TextField(decoration: new InputDecoration(icon:new Icon(Icons.person)), 
                onChanged: _setUser,
                )
              ),
              new ListTile(title:
                new TextField(decoration: new InputDecoration(icon:new Icon(Icons.security)),
                obscureText: true,
                onChanged: _setPassword,
                )
              ),
              new ListTile(title:
                new RaisedButton(child: new Text("login"), onPressed: _login,)
              ),
            ],
          ),
          ),
        ),
      ),
      )
    );
  }
  String username;
  String password;
  void _setUser(String text){
    username = text;
  }
  void _setPassword(String text){
    password = text;
  }
  var loggingIn = false;
  void _login () {
    if(username == null || password == null || loggingIn) return;
    loggingIn = true;
    firebaseAuth.signInWithEmailAndPassword(
        email: username, password: password
    ).then((user){
      if(user == null) {
        loggingIn = false;
      } else {
        // Navigator.pop(context);
        
      }
    });
  }
}