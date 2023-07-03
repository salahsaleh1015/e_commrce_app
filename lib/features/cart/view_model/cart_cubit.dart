
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/sevices/local_database_services.dart';
import '../model/cart_product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());

 static CartCubit get(context)=>BlocProvider.of(context);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;
  var dbHelper = CartDatabaseHelper.db;
  addProduct(CartProductModel cartProductModel) async {

  await dbHelper.insert(cartProductModel);
  emit(CartDataInsertedSuccessfullyState());
  }

  getAllProducts() async {
   _cartProductModel = await dbHelper.getAllProducts();
   print(_cartProductModel.length);
emit(CartDataRetrievedSuccessfullyState());
  }

}
