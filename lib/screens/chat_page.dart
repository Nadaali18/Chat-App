import 'package:chat_app/cubit/chat/chat_cubit.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widget/chat_buble_friend.dart';
import 'package:chat_app/widget/chat_buble_user.dart';
import 'package:chat_app/models/color&logo.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key, required this.email});

 List<MessageModel> messagesList = [];
  final String? email;
  final TextEditingController controller = TextEditingController();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsApp.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              height: 60,
            ),
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
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if(state is ChatSuccess){
                  messagesList = state.messages;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                    controller: scrollController,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBubleUser(
                              message: messagesList[index],
                            )
                          : ChatBubleFriend(message: messagesList[index]);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                controller.clear();
                scrollController.jumpTo(
                  scrollController.position.maxScrollExtent,
                );
              },
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        controller.clear();
                        scrollController.jumpTo(
                          scrollController.position.maxScrollExtent,
                        );
                      },
                      icon: const Icon(
                        Icons.send_rounded,
                        color: ColorsApp.primaryColor,
                      )),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(color: ColorsApp.primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(color: ColorsApp.primaryColor)),
                hintText: 'Send Message',
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
