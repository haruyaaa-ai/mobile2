import 'product_model.dart';

class CartItemModel {
  final ProductModel product;
  final int qty;

  CartItemModel({required this.product, required this.qty});

  CartItemModel copyWith({ProductModel? product, int? qty}) {
    return CartItemModel(
      product: product ?? this.product,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return {'product': product.toMap(), 'qty': qty};
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      product: ProductModel.fromMap(map['product']),
      qty: map['qty'] ?? 1,
    );
  }
}
