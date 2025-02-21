class ProductModel {
  String? productId;
  DateTime? createdAt;
  String? productName;
  String? price;
  String? oldPrice;
  String? sale;
  String? description;
  String? category;
  String? imageUrl;

  ProductModel({
    this.productId,
    this.createdAt,
    this.productName,
    this.price,
    this.oldPrice,
    this.sale,
    this.description,
    this.category,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json['product_id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        productName: json['product_name'] as String?,
        price: json['price'] as String?,
        oldPrice: json['old_price'] as String?,
        sale: json['sale'] as String?,
        description: json['description'] as String?,
        category: json['category'] as String?,
        imageUrl: json['image_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'created_at': createdAt?.toIso8601String(),
        'product_name': productName,
        'price': price,
        'old_price': oldPrice,
        'sale': sale,
        'description': description,
        'category': category,
        'image_url': imageUrl,
      };
}
