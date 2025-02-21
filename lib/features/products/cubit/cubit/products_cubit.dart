import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin/core/api_services.dart';
import 'package:our_market_admin/core/functions/sensitive_data.dart';
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

  String imageUrl = "";
  Future<void> uploadImage(
      {required Uint8List image,
      required String imageName,
      required String bucketName}) async {
    emit(UploadImageLoading());
    const String _storageBaseUrl =
        "https://adfznwtttqzsiuzjvyun.supabase.co/storage/v1/object";
    const String apiKey = anonKey;
    final String? token = await SharedPref.getToken();
    final String uploadUrl = "$_storageBaseUrl/$bucketName/$imageName";
    final Dio _dio = Dio();
    FormData formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(image, filename: imageName),
    });
    try {
      Response response = await _dio.post(uploadUrl,
          data: formData,
          options: Options(
            headers: {
              "apikey": apiKey,
              "Authorization": "Bearer $token",
              "Content-Type": "multipart/form-data"
            },
          ));
      if (response.statusCode == 200) {
        imageUrl =
            "https://adfznwtttqzsiuzjvyun.supabase.co/storage/v1/object/public/${response.data["Key"]}";
        emit(UploadImageSuccess());
      } else {
        emit(UploadImageError("Error uploading image"));
      }
    } catch (e) {
      log(e.toString());
      emit(UploadImageError(e.toString()));
    }
  }

  Future<void> editProduct(
      {required Map<String, dynamic> data, required String productId}) async {
    emit(EditProductLoading());
    try {
      String? token = await SharedPref.getToken();
      Response response = await _apiServices.patchData(
          "products_table?product_id=eq.$productId", data, token);
      if (response.statusCode == 204) {
        emit(EditProductSuccess());
      }
    } catch (e) {
      log(e.toString());
      emit(EditProductError(e.toString()));
    }
  }
}
