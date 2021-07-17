import 'package:flutter/material.dart';

class InventurScreen extends StatefulWidget {
  InventurScreen({Key key}) : super(key: key);

  @override
  _InventurScreenState createState() => _InventurScreenState();
}

class _InventurScreenState extends State<InventurScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.document_scanner),
      ),
    );
  }
}
