import 'package:chat/constants.dart';
import 'package:chat/models/message.dart';
import 'package:chat/screens/loading_screen.dart';
import 'package:chat/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  static String id = 'ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final scrollController = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollections);

  TextEditingController controller= TextEditingController();
  var email;

  @override
  Widget build(BuildContext context) {
    email =ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots() ,
      builder: (context, snapshot){
        if(snapshot.hasData){
          List<Message> messagesList=[];
          for(int i=0 ;i<snapshot.data!.docs.length;i++ ){
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(kLogo,
                    height: 55,
                  ),
                  const Text('Chat'),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemCount: messagesList.length,
                      itemBuilder: (context,index){
                    return messagesList[index].id == email?
                    ChatBubble(message: messagesList[index],) :
                        ChatBubbleForFriend(message: messagesList[index]);
                  }),
                ),
                Padding(
                  padding:const EdgeInsets.all(16),
                  child:  TextField(
                    controller: controller,
                    onSubmitted: (data){
                      sendMessage(data);
                      scrollDown();
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          sendMessage(controller.value.text);
                          scrollDown();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        icon: const Icon(Icons.send) ,
                      ),
                      suffixIconColor: kPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
          );
        }else{
          return const LoadingScreen();
        }
      },
    );
  }

  void sendMessage(String data) {
    messages.add({
      kMessage : data,
      kCreatedAt : DateTime.now(),
      'id' : email
    });
    controller.clear();
  }

  void scrollDown() {
    scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}

