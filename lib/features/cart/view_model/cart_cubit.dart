import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/sevices/local_database_services.dart';
import '../model/cart_product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  void buildSnakeBar(context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(

        backgroundColor: Colors.green, // set the background color to green
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // set the border radius
        ),
        content: Text('Product added to cart!'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'View Cart',
          onPressed: () {
            // navigate to the cart screen
          },
        ),
      ),
    );
  }

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;
  double _totlePrice = 0.0;
  double get totalPrice => _totlePrice;
  var dbHelper = CartDatabaseHelper.db;

  addProduct(CartProductModel cartProductModel , context) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totlePrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);
    buildSnakeBar(context);
    emit(CartDataInsertedSuccessfullyState());
  }

  getAllProducts() async {
    _cartProductModel = await dbHelper.getAllProducts();
    print(_cartProductModel.length);
    getTotalPrice();
    emit(CartDataRetrievedSuccessfullyState());
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totlePrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
    }
    emit(CartProductPriceCalculatedSuccessfullyState());
  }

  increaseQuantity(int index){
    _cartProductModel[index].quantity++;
    _totlePrice+=(double.parse(_cartProductModel[index].price.toString()));
    dbHelper.update(_cartProductModel[index]);
    emit(CartProductQuantityIncreasedSuccessfullyState());
  }
  decreaseQuantity(int index){
    _cartProductModel[index].quantity--;
    _totlePrice-=(double.parse(_cartProductModel[index].price.toString()));
    dbHelper.update(_cartProductModel[index]);
emit(CartProductQuantityDecreasedSuccessfullyState());
  }
}
