import 'package:flutter/material.dart';

class InventurItem extends StatefulWidget {
  InventurItem({Key key}) : super(key: key);

  @override
  _InventurItemState createState() => _InventurItemState();
}

class _InventurItemState extends State<InventurItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: new EdgeInsets.only(left: 25.0, right: 25.0, top: 20, bottom: 20),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );
  }
}
