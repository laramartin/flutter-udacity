import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
          child: Padding(padding: EdgeInsets.all(16.0),
            child: InkWell(
              child: Row(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(10.0),
                  child: FlutterLogo()
                  ),
                  new Center(
                    child: Text(" is coming!"),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}

void main() {
  print('Hello!');

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("List row")),
      body: ListRow(),
    ),
  ));
}
