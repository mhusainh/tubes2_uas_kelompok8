// To parse this JSON data, do
//
//     final favoritesResponsesModelGet = favoritesResponsesModelGetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FavoritesResponsesModelGet favoritesResponsesModelGetFromJson(String str) => FavoritesResponsesModelGet.fromJson(json.decode(str));

String favoritesResponsesModelGetToJson(FavoritesResponsesModelGet data) => json.encode(data.toJson());

class FavoritesResponsesModelGet {
    final int id;
    final String userId;
    final String imageId;
    final String subId;
    final String createdAt;
    final Image image;

    FavoritesResponsesModelGet({
        required this.id,
        required this.userId,
        required this.imageId,
        required this.subId,
        required this.createdAt,
        required this.image,
    });

    factory FavoritesResponsesModelGet.fromJson(Map<String, dynamic> json) => FavoritesResponsesModelGet(
        id: json["id"],
        userId: json["user_id"],
        imageId: json["image_id"],
        subId: json["sub_id"],
        createdAt: json["created_at"],
        image: Image.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image_id": imageId,
        "sub_id": subId,
        "created_at": createdAt,
        "image": image.toJson(),
    };
}

class Image {
    Image();

    factory Image.fromJson(Map<String, dynamic> json) => Image(
    );

    Map<String, dynamic> toJson() => {
    };
}