import 'package:flutter/material.dart';
import 'package:formexclusiv_inventur/models/scanned_item.dart';

class AddItemView extends StatelessWidget {
  final ScannedItem item;
  final List<String> kategorien;
  final mengeController = TextEditingController();
  final preisController = TextEditingController();
  AddItemView(this.item, this.kategorien);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('ID: ' + item.artNr),
          Text(item.bezeichnung),
          DropdownButton<String>(
            items: kategorien.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          TextField(
            controller: mengeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Anzahl'),
          ),
          TextFormField(
            initialValue: item.preis.toString(),
            //controller: preisController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Preis',
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              int anzahl = int.tryParse(mengeController.text);
              if (anzahl >= 0)
                Navigator.pop(
                  context,
                  new ScannedItem(item.artNr, item.bezeichnung, anzahl,
                      item.kategorie, item.preis),
                );
            },
            icon: Icon(Icons.check),
            label: Text('hinzufügen'),
          ),
        ],
      ),
    );
  }
}
