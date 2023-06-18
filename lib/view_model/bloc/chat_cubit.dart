import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context)=> BlocProvider.of(context);
  TextEditingController controller =TextEditingController();
  List<String> messages = [];
  Future<void> postData({required String msg})
  async
  {
    emit(SendMessageLoadingState());
    // http://127.0.0.1:5000/chat
    Map data = {
      "msg" : "hi"
    };
    String jsonStr = jsonEncode(data);
    FormData formData = FormData.fromMap({
      "msg" :msg
    });
    await Dio().post('http://10.0.2.2:5000/chat' ,
   data: formData
   ).then((value){
      messages.add(value.data['prediction']);
     print(value.data);
      emit(SendMessageSucessfulState());


    } ).catchError((onError)
   {
     if(onError is DioError){
       print(onError.response!.data);
       emit(SendMessageErorrState());

     }
     emit(SendMessageErorrState());

   });
  }
}
