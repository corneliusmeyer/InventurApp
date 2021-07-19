import 'package:flutter/material.dart';

/*class AddItemView extends StatefulWidget {
  AddItemView({Key key}) : super(key: key);

  @override
  _AddItemViewState createState() => _AddItemViewState();
}

class _AddItemViewState extends State<AddItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('ID: '),
          Text('Bezeichnung: '),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Anzahl'),
          ),
        ],
      ),
    );
  }
}*/

class AddItemView extends StatelessWidget {
  const AddItemView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('ID: '),
          Text('Bezeichnung: '),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Anzahl'),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.check),
            label: Text('hinzufügen'),
          ),
        ],
      ),
    );
  }
}
