import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 100.0,
            width: 300.0,
            child: Padding(padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    new Center(
                      child: Text("Lara is ", style: TextStyle(fontSize: 30.0)),
                    ),
                    new FlutterLogo(size: 50.0,
                    ),
                    new Center(
                      child: Text("ing! 😱", style: TextStyle(fontSize: 30.0)),
                    )
                  ],
            )
          )
        )
      )
    );
  }
}

void main() {
  print('Hello!');

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("whaaaat")),
      body: ListRow(),
    ),
  ));
}
