import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/code/resource/color_mananger.dart';

import '../../../../view_model/bloc/chat_cubit.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            bottomSheet:                 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children:
                [

                  Expanded(
                    child: TextFormField(
                      controller: ChatCubit.get(context).controller,
                    ),
                  ),
                  ElevatedButton(

                    child: Icon(Icons.send,color: Colors.blueGrey),
                    onPressed: (){
                      ChatCubit.get(context).postData(msg:ChatCubit.get(context).controller.text );
                      ChatCubit.get(context).controller.clear();
                      },
                  ),
                ],
              ),
            ),

            body: Padding(
              padding:const EdgeInsets.symmetric(  horizontal: 24 , vertical: 50) ,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 20,),
                itemCount: ChatCubit.get(context).messages.length,
                itemBuilder: (context, index)
              {
               return  ChatCubit.get(context).messages[index].name == "bot" ?
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: ColorManage.primaryBlue
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(ChatCubit.get(context).messages[index].message! ,
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                        ),
                      ),
                    ) : Container(

                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(24),
                     color: Colors.blueGrey
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Text(ChatCubit.get(context).messages[index].message! ,
                     style:   const TextStyle(
                         color: Colors.white
                     ),
                   ),
                 ),
               );
              },),
            )
          );
        },
      ),
    );
  }
}
