import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class CartCubit extends Cubit<List<CartItemModel>> {
  CartCubit() : super([]);

  void addToCart(ProductModel product) {
    final index = state.indexWhere((item) => item.product.id == product.id);

    if (index == -1) {
      emit([...state, CartItemModel(product: product, qty: 1)]);
    } else {
      final updated = state[index].copyWith(qty: state[index].qty + 1);
      final newList = [...state];
      newList[index] = updated;
      emit(newList);
    }
  }

  void removeFromCart(ProductModel product, int qty) {
    final index = state.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      if (qty <= 0) {
        final newList = [...state]..removeAt(index);
        emit(newList);
      } else {
        final updated = state[index].copyWith(qty: qty);
        final newList = [...state];
        newList[index] = updated;
        emit(newList);
      }
    }
  }

  int getTotalItems() {
    return state.fold(0, (sum, item) => sum + item.qty);
  }

  int getTotalPrice() {
    return state.fold(0, (sum, item) {
      return sum + (int.parse(item.product.price) * item.qty);
    });
  }

  void clearCart() {
    emit([]);
  }
}
