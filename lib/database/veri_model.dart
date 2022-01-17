
import 'dart:convert';

DataModel mailModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String mailModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.id,
    required this.name,
    required this.creat,
    required this.size,
  });

  int id;
  String name;
  int creat;
  int size;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    id: json["id"],
    name: json["name"],
    creat: json["creat"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "creat": creat,
    "size": size,
  };
}
