import 'package:flutter/material.dart';
import 'package:tfg_ione/src/pages/home/components/units.dart';
import 'package:tfg_ione/src/widgets/myAppBar.dart';


class HomePage extends StatefulWidget {
 HomePage({Key key}) : super(key: key);

  @override
   HomePageState createState() =>  HomePageState();
}

class  HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppBar(
        title: 'Inicio',
      ),
      body: _body(context),     
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Unities(),
        ],
      ),
    );
  }
}