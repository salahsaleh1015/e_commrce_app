import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/sevices/home_services.dart';
import '../model/category_model.dart';
import '../model/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;


  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];
  getCategory() async {
    emit(HomeLoadingCategoriesDataState());
    HomeServices().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
          _categoryModel.add(
              CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
          print(_categoryModel.length);

      }
    }).then((value) {
      emit(HomeSuccessCategoriesDataState());
    }).catchError((error) {
      print(error);
      emit(HomeErrorCategoriesDataState());
    });
  }

  // getCategory() async {
  //   emit(HomeLoadingCategoriesDataState());
  //   bool isListPopulated = false;
  //   HomeServices().getCategory().then((value) {
  //     for (int i = 0; i < value.length; i++) {
  //       _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
  //       if (i == value.length - 1) {
  //         isListPopulated = true;
  //       }
  //     }
  //   }).then((value) {
  //     if (isListPopulated) {
  //       emit(HomeSuccessCategoriesDataState());
  //     }
  //   }).catchError((error) {
  //     print(error);
  //     emit(HomeErrorCategoriesDataState());
  //   });
  // }

  getProducts() async {
    emit(HomeLoadingProductDataState());
    HomeServices().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<String, dynamic>));
        print(_productModel.length);
      }
    }).then((value) {
      emit(HomeSuccessProductDataState());
    }).catchError((error) {
      print(" product $error");
      emit(HomeErrorProductsDataState());
    });
  }
}
