import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool hasData = true;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/fe_logo.png",
              height: 130,
            ),
            Text("Inventur"),
            (hasData == true)
                ? ElevatedButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.mode_edit),
                    label: Text('Inventur fortsetzen'))
                /*ElevatedButton.icon(
                        onPressed: null,
                        icon: Icon(Icons.ac_unit_outlined),
                        label: Text('Inventur abschließen')),
                    ElevatedButton.icon(
                        onPressed: null,
                        icon: Icon(Icons.ac_unit_outlined),
                        label: Text('Inventur löschen'))*/

                : Text('Neue Inventur anlegen'),
          ],
        ),
      ),
    );
  }
}
