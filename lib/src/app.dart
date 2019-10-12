import 'package:flutter/material.dart' ;
import 'package:http/http.dart' show get ;
import 'models/image_models.dart';
import 'dart:convert';
import 'widgets/image_list.dart';
import 'dart:math' show Random ;




class App extends StatefulWidget{

  @override
  createState() {
    
    return AppState();
  }

}


class AppState extends State<App>{
  //int counter = 0;
  Random rand = new Random();

  List<ImageModel> images = [];

  void fetchImage() async {
      //counter++;
    int randInt = rand.nextInt(300);
    final response = await get('https://picsum.photos/id/$randInt/info');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
    
  }



  Widget build(context){
    return MaterialApp(
    home: Scaffold(
      appBar:  AppBar(
        backgroundColor : Colors.orange[300],
        title: Text("Random Gallery"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage ,

        child: Icon(Icons.add,
        size: 40,
        ),
        backgroundColor: Colors.blue, 
      ),
      body: ImageList(images),
    ),
  );
  }
}