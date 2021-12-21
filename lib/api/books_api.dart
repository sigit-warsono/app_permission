import 'dart:convert';

import 'package:userpermission/model/book.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  static Future<List<Book>> getBooks(String query) async {
    final url = Uri.parse(
        'http://103.83.179.38:8900/hrd/android/permission/data_izin_karyawan.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List books = json.decode(response.body);

      return books.map((json) => Book.fromJson(json)).where((book) {
        final titleLower = book.name.toLowerCase();
        final authorLower = book.nip.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}