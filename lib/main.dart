import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
//    Firestore.instance.collection('mountains').document()
//        .setData({ 'title': 'Mount Baker', 'type': 'volcano' });

    super.initState();
  }

  @override
  Widget build(BuildContext context, DocumentSnapshot document) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Data(),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          Firestore.instance.collection('database').document().setData(
            {
              'dateTime': '2020/11/08 21.00',
              'energy': .285,
              'units':0
            },
          );
        },
      ),
    );
  }
}

class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: Firestore.instance.collection('database').snapshots(),
      builder: (context,snapshot) {
        if (!snapshot.hasData)
          return new Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((document) {
            return new ListView.builder(
              itemExtent: 80.0,
              itemCount:snapshot.data.documents.length,
              itemBuilder:(context,index),
            );
          }).toList(),
        );
      },
    );
  }
}

