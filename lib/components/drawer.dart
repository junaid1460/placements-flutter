import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  var _text = "";
  AppDrawer(this._text);
  @override
  AppDrawerState createState() => new AppDrawerState(_text);
  void test(){
    
  }
}

class AppDrawerState extends State<AppDrawer> {
  var _title = "None";
  AppDrawerState(this._title);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(child: new Text(_title))
        ],
      ),
    );
  }
  void setHeaderText(String text){
    setState((){
      _title = text;
    });
  }
}