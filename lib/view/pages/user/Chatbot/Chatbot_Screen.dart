import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

            body: Column(
              children: [
                Row(
                  children:
                  [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true
                          ,itemBuilder: (context, index)
                      {
                        return Text("Amr");
                      }),
                    ),
                    Spacer(),
                    Expanded(
                      child: TextFormField(
                        controller: ChatCubit.get(context).controller,
                      ),
                    ),
                    ElevatedButton(
                      child: Text("Hi"),
                      onPressed: (){
                        ChatCubit.get(context).postData(msg: "hi");
                      },
                    ),
                  ],
                ),
              ],
            )
          );
        },
      ),
    );
  }
}
