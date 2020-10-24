import 'dart:io';

import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../screens/add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  Widget _buildGreatPlaceList(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces(),
      builder: (ctx, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? Platform.isIOS
              ? CupertinoActivityIndicator()
              : Center(child: CircularProgressIndicator())
          : Consumer<GreatPlaces>(
              child: Center(
                child: const Text('Got no places yes, start adding some!'),
              ),
              builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
                  ? ch
                  : ListView.builder(
                      itemBuilder: (ctx, i) => Platform.isIOS
                          ? CupertinoListTile(
                              leading: Image.file(greatPlaces.items[i].image),
                              title: Text(greatPlaces.items[i].title),
                              onTap: () {
                                // Go to detail screen
                              },
                            )
                          : ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlaces.items[i].image),
                              ),
                              title: Text(greatPlaces.items[i].title),
                              onTap: () {
                                // Go to detail screen ...
                              },
                            ),
                      itemCount: greatPlaces.items.length,
                    ),
            ),
    );
  }

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
                          Navigator.of(context)
                              .pushNamed(AddPlaceScreen.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: _buildGreatPlaceList(context),
          )
        : _buildGreatPlaceList(context);

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
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                },
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
