import 'package:flutter/services.dart';

import 'dart:convert';

import 'package:tfg_ione/src/models/unit_model.dart';

class UnitiesProvider {
  Future<List<UnitModel>> getUnits() async {
    final String response = await rootBundle.loadString('data/units_data.json');
    final unitsData = json.decode(response);

    final List<UnitModel> units = [];

    unitsData['units'].forEach((unit) {
      final prodTemp = UnitModel.fromJson(unit);
      units.add(prodTemp);
    });

    return units;
  }
}
