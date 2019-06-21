import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseStatePage<T extends StatefulWidget> extends State<T> {
  GlobalKey<ScaffoldState> getGlobalKey();

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

  /// Can be used for button click
  void showLoadingDialog([String message = "Loading..."]) {
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
                  child: new Text(message)),
            ],
          ));
        });
  }

  /// Can be used as single UI element
  Widget getLoadingWidget([String message = "Loading..."]) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: EdgeInsets.all(20.0),
            child: new CircularProgressIndicator()),
        Padding(
            padding: EdgeInsets.only(
                left: 30.0, top: 20.0, right: 20.0, bottom: 20.0),
            child: new Text(message)),
      ],
    );
  }

  void showSimpleDialog(String title, String message,
      {Function positiveCallback,
      Function negativeCallback,
      String positiveButton = "Ok",
      String negativeButton = "Close"}) {
    showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              title: new Text(title),
              content: new Text(message),
              actions: <Widget>[
                new FlatButton(
                  child: new Text(negativeButton),
                  onPressed: () {
                    negativeCallback();
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text(positiveButton),
                  onPressed: () {
                    positiveCallback();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  void goBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}
