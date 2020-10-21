import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';
import '../widgets/image_input.dart';
import '../widgets/cupertino_icon_button.dart';
import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      // Could show an error dialog
      return;
    }
    
    Provider.of<GreatPlaces>(context, listen: false).addPlace(_pickedImage, _titleController.text);
    Navigator.of(context).pop();
  }

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
                  ImageInput(_selectImage),
                ],
              ),
            ),
          ),
        ),
        Platform.isIOS
            ? CupertinoIconButton(
                text: 'Add place',
                icon: CupertinoIcons.add,
                onPressed: _savePlace,
              )
            : RaisedButton.icon(
                icon: Icon(Icons.add),
                label: Text('Add place'),
                elevation: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Theme.of(context).accentColor,
                onPressed: _savePlace,
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
            body: _formColumn,
          );
  }
}
