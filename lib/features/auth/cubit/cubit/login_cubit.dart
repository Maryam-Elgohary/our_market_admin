import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin/core/api_services.dart';
import 'package:our_market_admin/core/shared_pref.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final ApiServices _apiServices = ApiServices();
  Future<void> login(Map<String, dynamic> data) async {
    try {
      emit(LoginLoading());
      Response response = await _apiServices.login("token", data);
      if (response.statusCode == 200) {
        await SharedPref.saveToken(response.data["access_token"]);
        emit(LoginSuccess());
      } else {
        emit(LoginError(msgError: response.data["msg"]));
      }
    } catch (e) {
      log(e.toString());
      emit(LoginError(msgError: "Something went wrong, please try again!"));
    }
  }
}
