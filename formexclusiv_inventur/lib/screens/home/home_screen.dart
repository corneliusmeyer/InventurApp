import 'package:flutter/material.dart';
import 'package:formexclusiv_inventur/screens/components/inventur_card.dart';
import 'package:formexclusiv_inventur/size_config.dart';
import 'package:formexclusiv_inventur/screens/home/components/create_inventur_dialog.dart';
import 'package:formexclusiv_inventur/models/profil.dart' as profil;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize * 2),
                child: Container(
                  child: ListView.builder(
                    itemCount: profil.inventur_holder.length,
                    itemBuilder: (context, index) =>
                        InventurCard(profil.inventur_holder[index]),
                  ),
                ),
              ),
            ),
            Text('(c) Cornelius Meyer, 2021'),
            SizedBox(
              height: 8,
            )
          ],
        ),
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
