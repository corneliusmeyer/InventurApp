import 'package:flutter/material.dart';
import 'package:formexclusiv_inventur/size_config.dart';
import 'package:formexclusiv_inventur/screens/home/components/create_inventur_dialog.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool hasData = true;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset("assets/images/fe_logo.png"),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text('Inventur'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(),
            ),
            Text('(c) Cornelius Meyer, 2021')
          ],
        ),
        /*child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Image.asset(
                "assets/fe_logo.png",
                height: 100,
              ),
              InventurCard('Inventur 2021', 500, 2300),
              InventurCard('Inventur 2020', 1000, 1200),
              InventurCard('Inventur 2019', 80, 90),
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
        ),*/
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Neue Inventur anlegen',
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) {
              return CreateInventurDialog();
            }),
        child: Icon(Icons.add),
      ),
    );
  }
}
