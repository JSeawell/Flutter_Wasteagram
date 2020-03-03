import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int _totalItemsWasted = 0;

  void _incrementItemsWastedCounter() {
    setState(() {
      _totalItemsWasted++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title} - ${_totalItemsWasted}"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_totalItemsWasted',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementItemsWastedCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}