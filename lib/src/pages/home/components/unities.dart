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
        unities.add([unity]);
      } else {
        UnityModel unity = new UnityModel();
        UnityModel unity2 = new UnityModel();
        unity.image = generateImage(i.toString());
        unity2.image = generateImage(i.toString() + '-2');
        unities.add([unity, unity2]);
      }
    }
    return unities;
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
      radius: 60.0,
      lineWidth: 5.0,
      percent: 1.0,
      center: Image(
        image: AssetImage('assets/images/units/' + unity.image)),
      progressColor: Colors.green,
    );
  }
}
