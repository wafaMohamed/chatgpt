import 'dart:developer';
import 'package:chatgpt/view/widget/custom_text.dart';
import 'package:chatgpt/view_model/provider/chats_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../constants/themes/app_theme.dart';
import '../../services/services.dart';
import '../../view_model/provider/models_provider.dart';
import '../widget/chat_widget.dart';
import '../widget/side_menu.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late FocusNode focusNode;
  bool isTyping = false;

  // List<ChatModel> chatList = [];
  TextEditingController? textEditingController;
  late ScrollController _listScrollController;

  @override
  void initState() {
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController!.dispose();
    focusNode.dispose();
    super.dispose();
  }

  // List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      drawer:const SideMenu() ,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await Services.showModalSheet(context: context);
              },
              icon: Icon(
                Icons.more_vert_rounded,
                color: AppTheme.white,
              ))
        ],
        elevation: 2,
        title: const Center(child: Text("ChatGPT")),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
                controller: _listScrollController,
                itemCount: chatProvider.getChatList.length,
                itemBuilder: (context, index) {
                  return ChatWidget(
                      msg: chatProvider.getChatList[index].msg,
                      chatIndex: chatProvider.getChatList[index].chatIndex);
                }),
          ),
          if (isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
          ],
          const SizedBox(
            height: 15,
          ),
          Material(
              color: AppTheme.cardColor,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: focusNode,
                          style: const TextStyle(color: Colors.white),
                          controller: textEditingController,
                          onSubmitted: (value) async {
                            await sendMessageFCT(
                                modelsProvider: modelsProvider,
                                chatProvider: chatProvider);
                          },
                          decoration: const InputDecoration.collapsed(
                              hintText: "How can I help you",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            await sendMessageFCT(
                                modelsProvider: modelsProvider,
                                chatProvider: chatProvider);
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ))
                    ],
                  )))
        ],
      ),
    );
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT({required ModelsProvider modelsProvider,
    required ChatProvider chatProvider}) async {
    if (isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: TextWidget(
          label: "you can't send a multiple messegas at a one time!",
        ),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if (textEditingController!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: TextWidget(
          label: "Please Type a Message",
        ),
        backgroundColor: Colors.red,
      ));
      return;
    }
    try {
      String msg = textEditingController!.text;
      setState(() {
        isTyping = true;
        chatProvider.addUserMessage(msg: msg);
        textEditingController!.clear();
        focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(
          msg: msg, chosenModelId: modelsProvider.getcurrentModel);
      setState(() {});
    } catch (error) {
      log("error $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        isTyping = false;
      });
    }
  }
}
