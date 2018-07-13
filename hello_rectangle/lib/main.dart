import 'package:flutter/material.dart';

class MyRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            color: Colors.greenAccent,
            height: 400.0,
            width: 300.0,
            child: Center(
              child: Text(
                'Hello!',
                style: TextStyle(fontSize: 20.0),),
            )
        )
    );
  }
}

void main() {
  print('Hello!');

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("hot reload!")),
      body: MyRectangle(),
    ),
  ));
}
