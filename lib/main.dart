import 'package:flutter/material.dart';
import 'package:placements/components/drawer.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:placements/components/body.news.dart';
import 'package:placements/components/login.component.dart';
import 'package:placements/global.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

final  googleSignIn = new GoogleSignIn();

void main() => runApp(new OnLoad());


class PlacementsApp extends StatelessWidget {
  static final routeName = "/home";
  @override
  Widget build(BuildContext context){ 
    AppService.context = context;
    return 
    new MaterialApp(
      home : 
    
    new Scaffold(
      appBar: new AppBar(title: new Text("Placements"),),
      drawer: new AppDrawer("Hello"),
      body: new RaisedButton(child: new Text("Logout"), onPressed: logout,)
    )
    );
  }
  void logout(){
    firebaseAuth.signOut();
    // firebaseAuth.onAuthStateChanged.
  }
}


class OnLoad extends StatelessWidget {

  final routes = <String, WidgetBuilder> {
    PlacementsApp.routeName : (context) => new PlacementsApp(),
    LoginComponent.routeName : (context) => new LoginComponent()
  };
  @override
  Widget build(BuildContext context){
    return 
    new MaterialApp(
      routes: routes,
      home : new MyHomePage()
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   MyHomePageState createState() => new  MyHomePageState();
// }


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AppService.context = context;
     firebaseAuth.onAuthStateChanged.listen((user){ 
      if(user != null) { 
        Navigator.pushReplacementNamed(AppService.context, PlacementsApp.routeName);
      } else {
        Navigator.pushReplacementNamed(AppService.context, LoginComponent.routeName);
    }});
    
    return new Scaffold(
      body: new Center(
        child: new Container(
          child: new Center( child: new CircularProgressIndicator()),
          decoration: new BoxDecoration(color: Colors.white),
        )
      )
    );
  }
}