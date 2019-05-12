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
}
