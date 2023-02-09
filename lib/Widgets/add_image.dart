// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:native_features/Provider/PLaces_Provider.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;

class Add_image extends StatefulWidget {
  final Function onimageselect;
  Add_image(this.onimageselect);
  @override
  _Add_imageState createState() => _Add_imageState();
}

class _Add_imageState extends State<Add_image> {
  File _Vidchoosen = File('');
  Future<void> _takepic() async {
    ImagePicker picker = ImagePicker();
    final ImageChoosen = await picker.pickVideo(
      source: ImageSource.camera,
      // maxDuration: Duration(seconds: 10),
    );
    if (ImageChoosen == null) {
      return;
    }
    setState(() {
      _Vidchoosen = File(ImageChoosen.path);
    });
    final _storagelocation = await syspath.getApplicationDocumentsDirectory();
    final image_location = path.basename(ImageChoosen.path);
    final image_copy =
        await _Vidchoosen.copy('${_storagelocation.path}/$image_location');
    widget.onimageselect(image_copy);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Container(
        //   width: 150,
        //   height: 100,
        //   decoration: BoxDecoration(
        //     border: Border.all(width: 2.0),
        //   ),
        //   child: Center(
        //     child: _Vidchoosen != File('')
        //         ? Image.file(
        //             _Vidchoosen,
        //             fit: BoxFit.cover,
        //             width: double.infinity,
        //           )
        //         : Text('Image not choosen'),
        //   ),
        // ),
        SizedBox(
          width: 30.0,
        ),
        TextButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurpleAccent, //
          ),
          onPressed: () {
            _takepic();
          },
          icon: Icon(Icons.camera_outlined),
          label: Text(
            'Capture Moment',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
