import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input.dart';

import '../widgets/cupertino_icon_button.dart';
import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Platform.isIOS
                      ? CupertinoTextField(
                          placeholder: 'Title',
                          controller: _titleController,
                        )
                      : TextField(
                          controller: _titleController,
                          decoration: InputDecoration(labelText: 'Title'),
                        ),
                  SizedBox(height: 10),
                  ImageInput(),
                ],
              ),
            ),
          ),
        ),
        Platform.isIOS
            ? CupertinoIconButton(
                text: 'Add place',
                icon: CupertinoIcons.add,
                onPressed: () {},
              )
            : RaisedButton.icon(
                icon: Icon(Icons.add),
                label: Text('Add place'),
                elevation: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Theme.of(context).accentColor,
                onPressed: () {},
              ),
      ],
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: SafeArea(
              child: _formColumn,
            ),
            navigationBar: CupertinoNavigationBar(
              leading: GestureDetector(
                child: Icon(
                  CupertinoIcons.back,
                  color: CupertinoColors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              middle: Text('Add a New Place'),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Add a New Place'),
            ),
            body: _formColumn);
  }
}
