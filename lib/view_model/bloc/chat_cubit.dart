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
  List<ChatModel> messages = [];
  Future<void> postData({required String msg})
  async
  {
    emit(SendMessageLoadingState());
    // http://127.0.0.1:5000/chat
    Map data = {
      "msg" : "hi"
    };
    messages.add(ChatModel(
      message: msg,
      name: "me"
    ));
    String jsonStr = jsonEncode(data);
    FormData formData = FormData.fromMap({
      "msg" :msg
    });
    await Dio().post('http://10.0.2.2:5000/chat' ,
   data: formData
   ).then((value){
     print(value.data);
     // String x = value.data['prediction']['name'] ?? '';
     print("////////////////////////////////////////////");
     // print(x);
     print("////////////////////////////////////////////");
     // messages.add(
     //     ChatModel(
     //     name: "bot",
     //     message: value.data['prediction'].toString()
     // ));
     String x = jsonEncode( value.data['prediction']);
     if(x.contains('rate'))
       {
         messages.add(ChatModel(
             name: "bot",
             message: value.data['prediction']['name'] + " " + "rate " + value.data['prediction']['rate'].toString()
         ));
       }else{
       messages.add(ChatModel(
           name: "bot",
           message: value.data['prediction'].toString()
       ));
     }
     // if( value.data['prediction']['name'] == null){

     // }else{

     // }
     // messages.add(ChatModel(
     //     name: "bot",
     //     message: value.data['prediction'].toString()
     // ));
      emit(SendMessageSucessfulState());


    } ).catchError((onError)
   {
     if(onError is DioError){
       print(onError.response!.data);
       emit(SendMessageErorrState());

     }
     print(onError);
     emit(SendMessageErorrState());

   });
  }
}
class ChatModel {
  String  ? name;
  String  ? message;
   ChatModel({this.message , this.name});
}
