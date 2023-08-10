import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


import '../../Constant.dart';
import '../../Network/local_netwok/local.dart';
import '../../models/user_model.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  UserModel? userModel;
  void getUserData() async {
    emit(GetUserDataLoadingState());
    var response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/profile"),
        headers:
        {
          'Authorization' : token!,
          "lang" : "en"
        }
    );
    var responseData = jsonDecode(response.body);
    if( responseData['status'] == true )
    {
      userModel = UserModel.fromJson(data: responseData['data']);
      print("response is : $responseData");
      emit(GetUserDataSuccessState());
    }
    else
    {
      print("response is : $responseData");
      emit(FailedToGetUserDataState(message: responseData['message']));
    }
  }

  void ResetPassword({required String oldPassword,
    required String Newpassword}) async {
    emit(ResetPasswordLoadingState());
    try{
      var response = await http.post(
        // request => url = base url + method url
          Uri.parse('https://student.valuxapps.com/api/change-password'),
          body: {
            'current_password' : oldPassword,
            'new_password' : Newpassword
          },
          headers: {
            "Authorization":token!,
            "lang":"en"
          }
      );
      if( response.statusCode == 200 )
      {
        var responseData = jsonDecode(response.body);
        if( responseData['status'] == true )
        {
          debugPrint("User login success and his Data is :"
              " ${responseData['data']['token']}");
         // await CacheNetwork.insertToCache(key: "token",value: responseData['data']['token']);

          emit(ResetPasswordSuccessState(message:  responseData['message']));
        }
        else
        {
         debugPrint("Failed to login, reason is : ${responseData['message']}");
          emit(FaildResetPasswordDataState(message: responseData['message']));
        }
      }
    }
    catch(e){
      emit(FailedToResetPasswordState(message: e.toString()));
    }
  }

  int n = 0;
  final PageController pageController = PageController();
  void ChangeSelectScreen(int index){
    n=index;
    pageController.jumpToPage(index);
    emit(ChangeSelectScreenState());
  }


}
