import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:tfg_ione/src/models/unit_model.dart';

class UnitiesProvider {

  final apiUrl = 'https://master-7rqtwti-wqayjsyipydl6.eu-5.platformsh.site';

  Future<List<UnitModel>> getUnits() async {

    final String url = apiUrl + '/ione';

    final response = await http.get(
      Uri.parse(url),
    );

    final unitsData = json.decode(response.body);

    final List<UnitModel> units = [];

    unitsData['units'].forEach((unit) {
      final unitTemp = UnitModel.fromJson(unit);
      units.add(unitTemp);
    });

    return units;
  }
}
