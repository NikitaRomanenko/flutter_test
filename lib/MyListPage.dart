import 'package:flutter/material.dart';
import 'package:flutter_app/BaseStatePage.dart';

class MyListPage extends StatefulWidget {
  MyListPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends BaseStatePage<MyListPage> {
  List widgets = <Widget>[];
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();


  @override
  GlobalKey<ScaffoldState> getGlobalKey() => _globalKey;

  @override
  void initState() {
    super.initState();
    widgets = _getListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
        appBar: AppBar(
          title: Text("List View"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.of(context).pushNamed('/weather');
              },
            )
          ],
        ),
        body: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return _getRow(position);
            }));
  }

  _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 3; i++) {
      widgets.add(_getRow(i));
    }
    return widgets;
  }

  Widget _getRow(int i) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Text("Row $i"),
              RaisedButton(
                child: Text('Buttorn $i'),
                onPressed: () {
                  showToast("button $i");
                },
              )
            ],
          )),
      onTap: () {
        setState(() {
          widgets.add(_getRow(widgets.length + 1));
          print('row $i');
        });
      },
      onLongPress: () {
        setState(() {
          widgets.removeAt(i);
        });
      },
    );
  }
}
