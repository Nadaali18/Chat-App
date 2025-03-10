import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widget/chat_buble_friend.dart';
import 'package:chat_app/widget/chat_buble_user.dart';
import 'package:chat_app/models/color&logo.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
   const ChatPage({super.key,required this.email});
final String? email;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
   
   FirebaseFirestore firestore = FirebaseFirestore.instance;

   CollectionReference messages = FirebaseFirestore.instance.collection('messages');

   TextEditingController controller = TextEditingController();
   final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(

      stream: messages.orderBy('createdAt').snapshots(), 

      builder: (context,snapshot){
      if(snapshot.hasData){
       List<MessageModel> messagesList =[];
       for(int i=0;i<snapshot.data!.docs.length;i++){
        messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
       }

      return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsApp.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset(logo,height: 60,),
             const CustomText(
              'Chat',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        centerTitle: true,
          ),
       body: Column(
        children: [
          
          Expanded(

            child: ListView.builder(
              controller: _controller,
              itemCount: messagesList.length,
              itemBuilder:(context,index){
               return messagesList[index].id == widget.email ? ChatBubleUser(message: messagesList[index],)
               : ChatBubleFriend(message: messagesList[index]);
                
                }
              
              ),
          ),
          
          
          Padding(
           padding: const EdgeInsets.all(16),
           child: TextField(
            controller: controller,
            onSubmitted: (data){
              messages.add({
                'message':data,
                'createdAt':DateTime.now(),
                'id': widget.email,
              });
              controller.clear();
              _controller.jumpTo(
                _controller.position.maxScrollExtent, 
                );
            },
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: (){
                  String data = controller.text;
                  messages.add({
                    'message':data,
                    'createdAt':DateTime.now(),
                    'id': widget.email,
                  });
                  controller.clear();
                  _controller.jumpTo(
                   _controller.position.maxScrollExtent, 
                );
                  }, 
                  icon: const Icon(Icons.send_rounded,color: ColorsApp.primaryColor,)),
              ),
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: ColorsApp.primaryColor)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: ColorsApp.primaryColor)
            ),
            hintText: 'Send Message',
            hintStyle: TextStyle(color:Colors.grey[400] ),
            ),
           ),
         ), 
          ]
        ,
      ),    
      );
      }else{
       return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,width: double.infinity,
          color: ColorsApp.primaryColor.withOpacity(0.2),
          child:const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorsApp.primaryColor),
            ),
          ),
        ));
      }
      }
      );
  }
}
