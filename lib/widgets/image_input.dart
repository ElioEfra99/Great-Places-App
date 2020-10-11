import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/cupertino_icon_button.dart';
import '../widgets/flat_cupertino_icon_button.dart';

class ImageInput extends StatefulWidget {
  ImageInput({Key key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  final picker = ImagePicker();

  Future<void> _takePicture() async {
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = File(imageFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color:
                    Platform.isIOS ? CupertinoColors.systemGrey2 : Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No image taken'),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Platform.isIOS
              ? FlatCupertinoIconButton(
                  onPressed: _takePicture,
                  text: 'No picture taken',
                  icon: CupertinoIcons.photo_camera_solid,
                )
              : FlatButton.icon(
                  onPressed: _takePicture,
                  icon: Icon(Icons.camera),
                  label: Text('No picture taken'),
                  textColor: Theme.of(context).primaryColor,
                ),
        ),
      ],
    );
  }
}
