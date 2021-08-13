import 'package:flutter/material.dart';
import 'package:formexclusiv_inventur/models/inventur.dart';
import 'package:formexclusiv_inventur/screens/inventur/inventur_screen.dart';
import 'package:formexclusiv_inventur/provider/size_config.dart';

class InventurCard extends StatelessWidget {
  final Inventur _inventur;
  const InventurCard(this._inventur);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InventurScreen(
              inventur: _inventur,
            ),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 1.65,
        child: Padding(
          padding: EdgeInsets.all(defaultSize * 0.7),
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.blueGrey,
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
            child: Card(
              //color: new Color(0xFF333366),
              child: Column(
                children: [
                  Text(
                    _inventur.name,
                    style: TextStyle(fontSize: defaultSize * 2.2),
                  ),
                  Text(
                    _inventur.inventur_file.name,
                    style: TextStyle(fontSize: defaultSize * 2.2),
                  ),
                  SizedBox(
                    height: defaultSize * 0.5,
                  ),
                  buildInfoRow(defaultSize,
                      icon: Icons.check, text: "gescannt"),
                  buildInfoRow(defaultSize, icon: Icons.cancel, text: "übrig"),
                  Expanded(
                    child: SizedBox(),
                  ),
                  LinearProgressIndicator(
                    minHeight: 6,
                    value: 1 / 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Row buildInfoRow(double defaultSize, {icon, text}) {
  return Row(
    children: [Icon(icon), SizedBox(width: defaultSize), Text(text)],
  );
}
