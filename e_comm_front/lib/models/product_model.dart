import 'dart:convert';

class ProductModel {
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  final String? objectId;

  ProductModel({
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.objectId,
  });

  factory ProductModel.fromJson(String source) {
    /*
     {
        "_id": {
            "$oid": "60620c9efe57a62d8c041911"
        },
        "title": "Chocolate",
        "price": 8.0,
        "description": "Chocolate box 1 KG",
        "image_url": "http://www.bakerssupplies.pk/image/cache/Bakware%202/others/new/gcb-600x600.jpg"
    },
    */
    final Map<String, dynamic> data =
        jsonDecode(source) as Map<String, dynamic>;
    return ProductModel.fromJsonMap(data);
  }

  factory ProductModel.fromJsonMap(Map data) => ProductModel(
        objectId: data['_id']["\$oid"] as String,
        description: data['description'] as String,
        imageUrl: data.containsKey('image_url')
            ? data['image_url'] as String
            : data['image'] as String,
        price: data['price'].runtimeType == String
            ? double.parse(data['price'] as String)
            : data['price'] as double,
        title: data['title'] as String,
      );

  ProductModel copyWith({
    String? title,
    double? price,
    String? description,
    String? imageUrl,
    String? objectId,
  }) {
    return ProductModel(
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      objectId: objectId ?? this.objectId,
    );
  }

  Map<String, dynamic> toMapOnlyData() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
      // 'objectId': objectId,
    };
  }

  Map<String, dynamic> toMapAll() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
      'oid': objectId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] as String,
      price: map['price'] as double,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      objectId: map['objectId'] as String,
    );
  }

  String toJson() => json.encode(toMapOnlyData());

  @override
  String toString() {
    return 'ProductModel(title: $title, price: $price, description: $description, imageUrl: $imageUrl, objectId: $objectId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.title == title &&
        other.price == price &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.objectId == objectId;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        price.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        objectId.hashCode;
  }
}
