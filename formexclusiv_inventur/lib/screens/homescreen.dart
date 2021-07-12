import 'package:flutter/material.dart';
import 'package:formexclusiv_inventur/models/profil.dart';
import 'package:formexclusiv_inventur/screens/widgets/inventur_item.dart';

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
      floatingActionButton: FloatingActionButton(
        tooltip: 'Neue Inventur anlegen',
        onPressed: null,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Image.asset(
              "assets/fe_logo.png",
              height: 100,
            ),
            InventurItem(),
            /*Image.asset(
              "assets/fe_logo.png",
              height: 130,
            ),
            Text("Inventur"),
            (hasData == true)
                ? ListView.builder(
                    itemCount: 0,
                    itemBuilder: (context, index) {
                      return new InventurItem();
                    },
                  )
                : Text("Neue Inventur anlegen"),*/
          ],
        ),
      ),
    );
  }
}
