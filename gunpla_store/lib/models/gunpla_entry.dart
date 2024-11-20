// To parse this JSON data, do
//
//     final gunplaEntry = gunplaEntryFromJson(jsonString);

import 'dart:convert';

List<GunplaEntry> gunplaEntryFromJson(String str) => List<GunplaEntry>.from(json.decode(str).map((x) => GunplaEntry.fromJson(x)));

String gunplaEntryToJson(List<GunplaEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GunplaEntry {
    String model;
    String pk;
    Fields fields;

    GunplaEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory GunplaEntry.fromJson(Map<String, dynamic> json) => GunplaEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    String image;
    int price;
    String description;
    String sizeRatio;
    String extensions;
    String notes;

    Fields({
        required this.user,
        required this.name,
        required this.image,
        required this.price,
        required this.description,
        required this.sizeRatio,
        required this.extensions,
        required this.notes,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        sizeRatio: json["size_ratio"],
        extensions: json["extensions"],
        notes: json["notes"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "image": image,
        "price": price,
        "description": description,
        "size_ratio": sizeRatio,
        "extensions": extensions,
        "notes": notes,
    };
}
