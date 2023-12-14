// To parse this JSON data, do
//
//     final galleryUploadModel = galleryUploadModelFromJson(jsonString);

import 'dart:convert';

GalleryUploadModel galleryUploadModelFromJson(String str) => GalleryUploadModel.fromJson(json.decode(str));

String galleryUploadModelToJson(GalleryUploadModel data) => json.encode(data.toJson());

class GalleryUploadModel {
    bool? status;
    String? message;
    Link? link;

    GalleryUploadModel({
        this.status,
        this.message,
        this.link,
    });

    factory GalleryUploadModel.fromJson(Map<String, dynamic> json) => GalleryUploadModel(
        status: json["status"],
        message: json["message"],
        link: json["link"] == null ? null : Link.fromJson(json["link"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "link": link?.toJson(),
    };
}

class Link {
    String? schoolName;
    List<UploadedImage>? uploadedImage;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Link({
        this.schoolName,
        this.uploadedImage,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        schoolName: json["schoolName"],
        uploadedImage: json["uploadedImage"] == null ? [] : List<UploadedImage>.from(json["uploadedImage"]!.map((x) => UploadedImage.fromJson(x))),
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "schoolName": schoolName,
        "uploadedImage": uploadedImage == null ? [] : List<dynamic>.from(uploadedImage!.map((x) => x.toJson())),
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class UploadedImage {
    String? originalName;
    String? path;
    String? key;
    String? link;
    int? count;
    String? previosName;
    String? id;

    UploadedImage({
        this.originalName,
        this.path,
        this.key,
        this.link,
        this.count,
        this.previosName,
        this.id,
    });

    factory UploadedImage.fromJson(Map<String, dynamic> json) => UploadedImage(
        originalName: json["originalName"],
        path: json["path"],
        key: json["key"],
        link: json["link"],
        count: json["count"],
        previosName: json["previosName"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "originalName": originalName,
        "path": path,
        "key": key,
        "link": link,
        "count": count,
        "previosName": previosName,
        "_id": id,
    };
}
