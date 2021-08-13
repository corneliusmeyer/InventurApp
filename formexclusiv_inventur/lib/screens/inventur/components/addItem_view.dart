import 'package:flutter/material.dart';
import 'package:formexclusiv_inventur/models/scanned_item.dart';

class AddItemView extends StatelessWidget {
  final ScannedItem item;
  final myController = TextEditingController();
  AddItemView(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('ID: ' + item.artNr),
          Text('Bezeichnung: ' + item.bezeichnung),
          DropdownButton<String>(
            items: <String>['A', 'B', 'C', 'D'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          TextField(
            controller: myController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Anzahl'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              int anzahl = int.tryParse(myController.text);
              if (anzahl >= 0)
                Navigator.pop(
                    context,
                    new ScannedItem(item.artNr, item.bezeichnung, anzahl,
                        item.kategorie, item.preis));
            },
            icon: Icon(Icons.check),
            label: Text('hinzufügen'),
          ),
        ],
      ),
    );
  }
}
