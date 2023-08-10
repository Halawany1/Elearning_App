import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../Constant.dart';
import '../../Network/local_netwok/local.dart';
import '../../models/user_model.dart';

part 'learn_state.dart';

class LearnCubit extends Cubit<LearnState> {
  LearnCubit() : super(LearnInitial());

  List select =[
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  void ChangeSelectItem(int index){
    select[index]=!select[index];
    emit(LearnChangeSelect());
  }
  void login({required String email,required String password}) async {
    emit(LoginLoadingState());
    try{
      var response = await http.post(
        // request => url = base url + method url
        Uri.parse('https://student.valuxapps.com/api/login'),
        body: {
          'email' : email,
          'password' : password
        },
          headers: {
            "lang":"en"
          }
      );
      if( response.statusCode == 200 )
      {
        var responseData = jsonDecode(response.body);
        if( responseData['status'] == true )
        {
          debugPrint("User login success and his Data is : ${responseData['data']['token']}");
          await CacheNetwork.insertToCache(key: "token", value: responseData['data']['token']);

          emit(LoginSuccessState(message: responseData['message']));
        }
        else
        {
         debugPrint("Failed to login, reason is : ${responseData['message']}");
          emit(FailedToLoginState(message: responseData['message']));
        }
      }
    }
    catch(e){
      emit(FailedToLoginState(message: e.toString()));
    }
  }

  void register({required String email,required String name,
    required String phone,required String password}) async {
    emit(RegisterLoadingState());
    try{
      var response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/register'),
        body: {
          'name' : name,
          'email' : email,
          'password' : password,
          'phone' : phone,
          'image' : "jdfjfj"
        },
        headers: {
          "lang":"en"
        }
      );

      if( response.statusCode == 200 )
      {
        var data = jsonDecode(response.body);
        if( data['status'] == true )
        {
          debugPrint("Response is : $data");
          await CacheNetwork.insertToCache(key: "token", value:
          data['data']['token']);
          emit(RegisterSuccessState());
        }
        else
        {
         debugPrint("Response is : $data");
          emit(FailedToRegisterState(message: data['message']));
        }
      }
    }
    catch(e){
      debugPrint("Failed to Register , reason : $e");
      emit(FailedToRegisterState(message: e.toString()));
    }
  }



}


