import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
    _unityList = _generateUnities();
    return Container(
      child: _unitiesListView(),
    );
  }

  List _generateUnities() {
    List unities = [];

    for (var i = 0; i < 3; i++) {
      if (i % 2 == 0) {
        UnityModel unity = new UnityModel();
        unity.image = generateImage(i.toString());
        unity.color = Colors.red;

        unities.add([unity]);
      } else {
        UnityModel unity = new UnityModel();
        unity.image = generateImage(i.toString());
        unity.color = _generateColor();

        UnityModel unity2 = new UnityModel();
        unity2.image = generateImage(i.toString() + '-2');
        unity2.color = _generateColor();

        unities.add([unity, unity2]);
      }
    }
    return unities;
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

  Widget _unitiesListView() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) =>
            _unitiesColumn(context, _unityList[index]),
        itemCount: _unityList.length,
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

    return Container(height: 100, child: unity);
  }

  Widget _unity(BuildContext context, UnityModel unity) {
    return CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 5.0,
      percent: 0.5,
      center: Container(
        margin: EdgeInsets.fromLTRB(10, 11, 10, 11),
        decoration: BoxDecoration(
            color: unity.color, borderRadius: BorderRadius.circular(40)),
        child: Image(
          height: 80,
          image: AssetImage('assets/images/units/' + unity.image),
        ),
      ),
      progressColor: Colors.green,
    );
  }
}
