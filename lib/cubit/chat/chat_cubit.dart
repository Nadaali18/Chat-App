import 'package:bloc/bloc.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
     
   FirebaseFirestore firestore = FirebaseFirestore.instance;
   CollectionReference messages = FirebaseFirestore.instance.collection('messages');
   

  void sendMessages({required String email,required String message}){
    messages.add({'message':message,'createdAt':DateTime.now(),'id':email,});
    emit(ChatSuccess());   
  }

  void getMessages(){
    messages.orderBy('createdAt').snapshots().listen((event){
        emit(ChatSuccess());
    });
  }
}
