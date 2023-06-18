part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class SendMessageLoadingState extends ChatState{

}
class SendMessageSucessfulState extends ChatState{}
class SendMessageErorrState  extends ChatState{}