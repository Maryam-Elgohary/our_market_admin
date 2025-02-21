import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin/core/api_services.dart';
import 'package:our_market_admin/core/shared_pref.dart';
import 'package:our_market_admin/features/products/models/product_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    try {
      String? token = await SharedPref.getToken();
      Response response = await _apiServices.getData("products_table", token);
      for (Map<String, dynamic> product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      emit(GetProductsSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetProductsError(e.toString()));
    }
  }
}
