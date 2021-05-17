import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:tfg_ione/providers/units_provider.dart';
import 'package:tfg_ione/src/models/unit_model.dart';

class Unities extends StatefulWidget {
  Unities({Key key}) : super(key: key);

  @override
  _UnitiesState createState() => _UnitiesState();
}

class _UnitiesState extends State<Unities> {
  List _unitList = [];

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
              _unitList = [
                [units[0]],
                [units[1], units[2]],
                [units[3]],
                [units[4], units[5]],
              ];
              return unitiesListView();
            }
        }
      },
    );
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
              _unitiesColumn(context, _unitList[index]),
          itemCount: _unitList.length,
        ),
      ),
    );
  }

  Widget _unitiesColumn(BuildContext context, List unities) {
    Widget unit = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_unit(context, unities[0])],
    );

    if (unities.length == 2)
      unit = Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_unit(context, unities[0]), _unit(context, unities[1])],
      );

    return Container(
      height: 150,
      child: unit,
    );
  }

  Widget _unit(BuildContext context, UnitModel unit) {

    return Column(
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, 'exercises', arguments: unit),
          child: CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 5.0,
            percent: 0.65,
            center: Container(
              margin: EdgeInsets.fromLTRB(10, 11, 10, 11),
              decoration: BoxDecoration(
                  color: _getColor(unit),
                  borderRadius: BorderRadius.circular(40)),
              child: Image(
                height: 80,
                image: AssetImage('assets/images/units/' + unit.image),
              ),
            ),
            progressColor: Colors.green[400],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(unit.title),
        ),
      ],
    );
  }

  Color _getColor(UnitModel unit) {
    switch (unit.color) {
      case 'lime':
        return Colors.lime[300];

      case 'purple':
        return Colors.purple[300];

      case 'amber':
        return Colors.amber[300];

      case 'cyan':
        return Colors.cyan[300];

      case 'teal':
        return Colors.teal[300];

      case 'orange':
        return Colors.orange[300];

      default:
        return Colors.indigo[300];
    }
  }
}
