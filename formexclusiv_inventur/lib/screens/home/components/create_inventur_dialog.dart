import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:formexclusiv_inventur/models/profil.dart' as profil;
import 'package:formexclusiv_inventur/models/inventur.dart';

class CreateInventurDialog extends StatefulWidget {
  CreateInventurDialog({Key key}) : super(key: key);

  @override
  _CreateInventurDialogState createState() => _CreateInventurDialogState();
}

class _CreateInventurDialogState extends State<CreateInventurDialog> {
  TextEditingController _controller;
  String _filename = "keine";
  PlatformFile _file;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Bezeichnung',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text('Ausgewählte Inventur: ' + _filename),
                  ElevatedButton.icon(
                    onPressed: () async {
                      FilePickerResult result = await FilePicker.platform
                          .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['xlsx']);
                      if (result != null) {
                        _file = result.files.first;
                        setState(() {
                          _filename = _file.name;
                        });
                      }
                    },
                    icon: Icon(Icons.upload),
                    label: Text('Excel Datei auswählen'),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton.icon(
            // onPressed: () {profil.inventur_holder.add(new Inventur(name, _file, remainingScans, maxScans))},
            icon: Icon(Icons.check),
            label: Text('erstellen'),
          ),
        ],
      ),
    );
  }
}
