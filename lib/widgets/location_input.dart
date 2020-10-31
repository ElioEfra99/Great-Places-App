import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/flat_cupertino_icon_button.dart';

class LocationInput extends StatefulWidget {
  LocationInput({Key key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Platform.isIOS ? CupertinoColors.systemGrey2 : Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          child: _previewImageUrl == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Platform.isIOS
                ? Flexible(
                    flex: 1,
                    child: FittedBox(
                                          child: FlatCupertinoIconButton(
                        icon: CupertinoIcons.location_fill,
                        text: 'Current Location',
                        onPressed: () {},
                      ),
                    ),
                  )
                : Flexible(
                    flex: 1,
                    child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.location_on),
                      label: Text('Current Location'),
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
            Platform.isIOS
                ? Flexible(
                    flex: 1,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: FlatCupertinoIconButton(
                        icon: CupertinoIcons.map_fill,
                        text: 'Select on map',
                        onPressed: () {},
                      ),
                    ),
                  )
                : Flexible(
                    flex: 1,
                    child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.map),
                      label: Text('Select on map'),
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
          ],
        )
      ],
    );
  }
}
