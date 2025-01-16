class EventDM {
  late String name;
  late DateTime date;
  late DateTime time;
  late String ownerId;
  late int? lat;
  late int? lng;
  late String category;
  late String description;

  EventDM(
      {required this.name,
      required this.date,
      required this.time,
      required this.ownerId,
      this.lat,
      this.lng,
      required this.category,
      required this.description});

  EventDM.fromJson(Map json) {
    name = json["name"];
    date = json["date"];
    time = json["time"];
    ownerId = json["ownerId"];
    lat = json["lat"];
    lng = json["lng"];
    category = json["category"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["name"] = name;
    json["date"] = date;
    json["time"] = time;
    json["ownerId"] = ownerId;
    json["lat"] = lat;
    json["lng"] = lng;
    json["category"] = category;
    json["description"] = description;
    return json;
  }
}
