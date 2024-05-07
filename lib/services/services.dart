import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sos/gen/assets.gen.dart';
import 'package:sos/models/country_model.dart';

class ApiService {
  Future<List<Country>> getCountries() async {
    try {
      final json =
          await rootBundle.loadString(Assets.lib.assets.data.countries);

      final List<dynamic> listOfMaps =
          jsonDecode(json).cast<Map<String, dynamic>>();

      final List<Country> countries =
          listOfMaps.map((m) => Country.fromMap(m)).toList();

      final filteredCountries = countries
          .where(
            (country) =>
                country.ambulance.isNotEmpty ||
                country.fire.isNotEmpty ||
                country.police.isNotEmpty ||
                country.dispatch.isNotEmpty ||
                country.traffic.isNotEmpty,
          )
          .toList();

      return filteredCountries;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
