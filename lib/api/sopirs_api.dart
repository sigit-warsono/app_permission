import 'dart:convert';

import 'package:userpermission/model/sopir.dart';
import 'package:http/http.dart' as http;


class SopirsApi {
  static Future<List<Sopir>> getSopirs(String query) async {
    final url = Uri.parse(
        'http://103.83.179.38:8900/hrd/android/permission/sopir.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List sopirs = json.decode(response.body);

      return sopirs.map((json) => Sopir.fromJson(json)).where((sopir) {
        final titleLower = sopir.name.toLowerCase();
        final authorLower = sopir.nip.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}