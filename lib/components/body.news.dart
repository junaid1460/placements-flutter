import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class AppNews extends StatefulWidget {

  @override
  AppNewsState createState() => new AppNewsState();

}

class AppNewsState extends State<AppNews> {


  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('news').snapshots,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((document) {
            return new Padding(child: new Card(child: new Column( 
              children: <Widget>[
                new ListTile(
                  title : new Text(document['title']),
                  leading: new Icon(Icons.info),
                ),
                new Padding(padding: new EdgeInsets.all(8.0),
                child: new Text(document['content']),
                )
              ],
              )
            ),
             padding: new EdgeInsets.all(2.0));
          }).toList(),
        );
      },
    );
  }

}