import 'package:country_data/country_data.dart';

class Country {
  final String name;
  final String nativeName;
  final String isoCode;
  final List<String> ambulance;
  final List<String> fire;
  final List<String> police;
  final List<String> dispatch;
  final List<String> traffic;
  bool isFavorite;

  Country({
    required this.name,
    required this.nativeName,
    required this.isoCode,
    required this.ambulance,
    required this.fire,
    required this.police,
    required this.dispatch,
    required this.traffic,
    this.isFavorite = false,
  });

  factory Country.fromMap(Map<String, dynamic> json) {
    final bool member112 = json['Member_112'];
    final List<String> dispatch = _jsonNumberToList(json['Dispatch']);
    if (member112) {
      dispatch.add('112');
    }
    return Country(
      name: json['Country']['Name'],
      isoCode: json['Country']['ISOCode'],
      nativeName: _getNativeName(json['Country']['ISOCode']),
      ambulance: _jsonNumberToList(json['Ambulance']),
      fire: _jsonNumberToList(json['Fire']),
      police: _jsonNumberToList(json['Police']),
      dispatch: dispatch,
      traffic: _jsonNumberToList(json['Traffic']),
    );
  }
}

String _getNativeName(String isoCode) {
  return CountryData().getCountries().firstWhere((c) => c.id == isoCode).native;
}

List<String> _jsonNumberToList(Map<String, dynamic>? json) {
  if (json == null) return [];

  final List<String> list = [];
  json.forEach(
    (key, value) {
      for (var e in value) {
        if (e != null && e != '') {
          // e is a phone number if it contains a dash, create a list of phone numbers
          // example 776111-5 -> ['776111', '776112', '776113', '776114', '776115']
          if (e.contains('-')) {
            final split = e.split('-');
            final start = int.parse(split[0]);
            final str =
                split[0].substring(0, split[0].length - split[1].length);

            final end = int.parse('$str${split[1]}');
            for (var i = start; i <= end; i++) {
              list.add(i.toString());
            }
          } else {
            list.add(e);
          }
        }
      }
    },
  );
  return list;
}
