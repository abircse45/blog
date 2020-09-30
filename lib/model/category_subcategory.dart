
import 'dart:convert';

Gagro gagroFromJson(String str) => Gagro.fromJson(json.decode(str));

String gagroToJson(Gagro data) => json.encode(data.toJson());

class Gagro {
  Gagro({
    this.success,
    this.message,
    this.data,
    this.errors,
  });

  bool success;
  String message;
  Data data;
  Errors errors;

  factory Gagro.fromJson(Map<String, dynamic> json) => Gagro(
        success: json["Success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        errors: Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "message": message,
        "data": data.toJson(),
        "errors": errors.toJson(),
      };
}

class Data {
  Data({
    this.dataList,
  });

  List<DataList> dataList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataList: List<DataList>.from(
            json["data_list"].map((x) => DataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data_list": List<dynamic>.from(dataList.map((x) => x.toJson())),
      };
}

class DataList {
  DataList({
    this.id,
    this.name,
    this.color,
    this.image,
    this.description,
    this.child,
  });

  int id;
  String name;
  dynamic color;
  String image;
  dynamic description;
  List<DataList> child;

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        image: json["image"],
        description: json["description"],
        child:
            List<DataList>.from(json["child"].map((x) => DataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "image": image,
        "description": description,
        "child": List<dynamic>.from(child.map((x) => x.toJson())),
      };
}

class Errors {
  Errors();

  factory Errors.fromJson(Map<String, dynamic> json) => Errors();

  Map<String, dynamic> toJson() => {};
}
