import 'dart:convert';

import 'package:estudo_flutter/util/constants.dart';
import 'package:http/http.dart' as http;

class Person {
   String id;
   String name;
   String urlImage;

  Person({this.id, this.name, this.urlImage});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json["_id"],
      name: json["name"],
      urlImage: json["url_image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'url_image': urlImage};
  }

  static Future<List<dynamic>> get() async {
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
      return json.decode(response.body);
    } else {
      throw Exception('Failed to save person.');
    }
  }

  static Future<dynamic> delete(Person person) async {
    final response = await http.delete("$url_person/${person.id}");

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to delete person.');
    }
  }
}
