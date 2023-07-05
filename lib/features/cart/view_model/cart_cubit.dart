import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/sevices/local_database_services.dart';
import '../model/cart_product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  void buildSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text('Product added to cart!'),
        );
      },
    );
  }

  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;
  double _totlePrice = 0.0;

  double get totalPrice => _totlePrice;
  var dbHelper = CartDatabaseHelper.db;

  addProduct(CartProductModel cartProductModel, context) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totlePrice +=
    (double.parse(cartProductModel.price) * cartProductModel.quantity);
    buildSimpleDialog(context);
    emit(CartDataInsertedSuccessfullyState());
  }

  getAllProducts() async {
    _cartProductModel = await dbHelper.getAllProducts();
    print(_cartProductModel.length);
    getTotalPrice();
    emit(CartDataRetrievedSuccessfullyState());
  }

  getTotalPrice() {
     _totlePrice = 0.0;
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totlePrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
    }
    emit(CartProductPriceCalculatedSuccessfullyState());
  }

  increaseQuantity(int index) {
    _cartProductModel[index].quantity++;
    _totlePrice += (double.parse(_cartProductModel[index].price.toString()));
    dbHelper.update(_cartProductModel[index]);
    emit(CartProductQuantityIncreasedSuccessfullyState());
  }

  decreaseQuantity(int index) {
    _cartProductModel[index].quantity--;
    _totlePrice -= (double.parse(_cartProductModel[index].price.toString()));
    dbHelper.update(_cartProductModel[index]);
    emit(CartProductQuantityDecreasedSuccessfullyState());
  }


Future<void> deleteProduct(String productId , int index) async {
    await dbHelper.deleteData(id: productId).then((value){
      _totlePrice = 0.0;
      getTotalPrice();
      getAllProducts();
      emit(CartProductDeletedFromCartSuccessfullyState());
    });

}

}
