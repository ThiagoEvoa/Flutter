import 'dart:convert';

import 'package:estudo_flutter/model/person.dart';
import 'package:estudo_flutter/util/constants.dart';
import 'package:http/http.dart' as http;

class PersonService {
  static Future<dynamic> fetch() async {
    final response = await http.get(url_person);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to retrieve people.');
    }
  }

  static Future<dynamic> save(Person person) async {
    final response = person.id != null
        ? await http.put(url_person,
            body: jsonEncode(person), headers: jsonContentType)
        : await http.post(url_person,
            body: jsonEncode(person), headers: jsonContentType);

    if (response.statusCode == 200) {
      return "Person saved.";
    } else {
      throw Exception('Failed to save person.');
    }
  }

  static Future<dynamic> delete(Person person) async {
    final response = await http.delete("$url_person/${person.id}");

    if (response.statusCode == 200) {
      return "Person deleted.";
    } else {
      throw Exception('Failed to delete person.');
    }
  }
}
