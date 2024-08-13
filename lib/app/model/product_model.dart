import 'dart:convert';

class Product {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final int? quantity;
  final String? image;
  final Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.quantity,
    this.image,
    this.rating,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int?,
      title: map['title'] as String?,
      price: (map['price'] as num?)?.toDouble(),
      description: map['description'] as String?,
      category: map['category'] as String?,
      quantity: map['quantity'] as int?,
      image: map['image'] as String?,
      rating: map['rating'] != null ? Rating.fromJson(map['rating']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'quantity': quantity,
      'image': image,
      'rating': rating?.toJson(),
    };
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductExtension on Product {
  String getProductNameOrLoading(Product ProductById, int id) {
    return ProductById.id == id
        ? ProductById.title ?? 'Loading..'
        : 'Loading..';
  }
}

class Rating {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}
