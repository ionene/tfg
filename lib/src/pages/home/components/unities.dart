import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:tfg_ione/providers/unities_provider.dart';
import 'package:tfg_ione/src/models/unity_model.dart';

class Unities extends StatefulWidget {
  Unities({Key key}) : super(key: key);

  @override
  _UnitiesState createState() => _UnitiesState();
}

class _UnitiesState extends State<Unities> {
  List _unityList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: _unitiesListView(),
      child: _getUnits(),
    );
  }

  Widget _getUnits() {
    UnitiesProvider unitiesProvider = new UnitiesProvider();

    return FutureBuilder(
      future: unitiesProvider.getUnits(),
      initialData: [],
      builder: (BuildContext context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else {
              var units = snapshot.data;
              var patata = [
                [units[0]], 
                [units[1], units[2]],
                [units[3]], 
                [units[4], units[5]],
              ];

              _unityList = patata;
              return unitiesListView();
            }
        }
      },
    );
  }

  Color _generateColor() {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.pink,
      Colors.yellow,
      Colors.orange,
      Colors.grey,
      Colors.purple
    ];

    Random random = new Random();
    int randomNumber = random.nextInt(7);

    return colors[randomNumber];
  }

  String generateImage(String number) {
    return 'image-' + number.toString() + '.png';
  }

  Widget unitiesListView() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: ListView.builder(
          itemBuilder: (context, index) =>
              _unitiesColumn(context, _unityList[index]),
          itemCount: _unityList.length,
        ),
      ),
    );
  }

  Widget _unitiesColumn(BuildContext context, List unities) {
    Widget unity = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_unity(context, unities[0])],
    );

    if (unities.length == 2)
      unity = Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_unity(context, unities[0]), _unity(context, unities[1])],
      );

    return Container(
      height: 150, 
      child: unity,
    );
  }

  Widget _unity(BuildContext context, UnitModel unity) {
    Color color = Colors.black;

    switch (unity.color) {
      case 'green':
        color = Colors.green[200];
    }

    return Column(
      children: [
        CircularPercentIndicator(
          radius: 80.0,
          lineWidth: 5.0,
          percent: 0.5,
          center: Container(
            margin: EdgeInsets.fromLTRB(10, 11, 10, 11),
            decoration: BoxDecoration(
               color: color, borderRadius: BorderRadius.circular(40)),
            child: Image(
              height: 80,
              image: AssetImage('assets/images/units/' + unity.image),
            ),
          ),
          progressColor: Colors.green,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(unity.title),
        ),
      ],
    );
  }
}
