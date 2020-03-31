
import 'dart:convert';
//import 'dart://html';

import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http  ;



void main()=>runApp(new MaterialApp(
  home :new HomePage(),
));

class HomePage extends StatefulWidget{
@override
  homepagestate createState() =>new homepagestate ();
}

class homepagestate extends State<HomePage> {
  final String url="https://swapi.co/api/people";

  List data;

  @override
  void initState(){
    super.initState();
    this.getJson();
  }

  Future<String> getJson()  async{

    var response = await http.get(url
     // Uri.encodeFull(url),

      //headers:{"Accept":"Application/json"}
    );


    setState(() {
      var conertjsondta= json.decode(response.body);
      print(response.body);
      data=conertjsondta['results'];
      print(data.length);
    });

    return"Sucess";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("load json data using http "),
      ),
      body: new ListView.builder(
            itemCount:data==null ?0:data.length,

            itemBuilder: (BuildContext Context,int index){

              var len=data[index]['films'].length;//we can print the no of films in a paticular node
              return new Container(
                child: new Center(
                 child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: <Widget>[
                     new Card(
                       child: new Container(
                         child: new Text(data[index]['films'][0]),
                         padding: const EdgeInsets.all(10.0),
                       ),

                     )

                   ],
                  ),
                ),
              );

            },
      ),

    );
  }



}