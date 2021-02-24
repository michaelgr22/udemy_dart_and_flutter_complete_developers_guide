import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      //informs to rerender the screen
      images.add(imageModel);
    });
  }

  //build method returns the widgets that 'this' widget will show
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fetchImage,
      ),
      appBar: AppBar(
        title: Text('Lets see some images!'),
      ),
    ) //home keyword = Home Screen (frist screen that pops up)
        );
  }
}
