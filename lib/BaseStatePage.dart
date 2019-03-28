import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseStatePage<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  GlobalKey<ScaffoldState> getGlobalKey() {}

  void showToast(String text) {
    final scaffold = getGlobalKey().currentState;
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void showLoadingDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new CircularProgressIndicator()),
              Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, top: 20.0, right: 20.0, bottom: 20.0),
                  child: new Text("Loading")),
            ],
          ));
        });
  }

  void goBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}
