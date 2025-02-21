import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin/core/api_services.dart';
import 'package:our_market_admin/core/shared_pref.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final ApiServices _apiServices = ApiServices();

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    try {
      String? token = await SharedPref.getToken();
      Response response = await _apiServices.getData("products_table", token);
      print(response.data);

      emit(GetProductsSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetProductsError(e.toString()));
    }
  }
}
