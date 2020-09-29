import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageBody = Platform.isIOS
        ? NestedScrollView(
            headerSliverBuilder: (BuildContext ctx, bool innerBoxIsScrolled) {
              return <Widget>[
                CupertinoSliverNavigationBar(
                  largeTitle: Text('Your Places'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        child: Icon(CupertinoIcons.add),
                        onTap: () {
                          showCupertinoDialog(
                            context: ctx,
                            builder: (_) => CupertinoAlertDialog(
                              title: Text('Hey!'),
                              content: Text('Do you like cheese?'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: Center(
              child: CupertinoActivityIndicator(),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );

    final pageBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Your Places'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () {},
                ),
              ],
            ),
          )
        : AppBar(
            title: Text('Your Places'),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              )
            ],
          );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
          )
        : Scaffold(
            appBar: pageBar,
            body: pageBody,
          );
  }
}
