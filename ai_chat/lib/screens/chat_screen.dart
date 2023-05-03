import 'dart:async';
import 'dart:developer';

import 'package:ai_chat/providers/chats_provider.dart';
import 'package:ai_chat/providers/models_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../models/chat_models.dart';
import '../providers/chats_provider.dart';
import '../services/api_service.dart';
import '../services/assets_manager.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = false;

  bool _isEnabled = false;

  late TextEditingController textEditingController;
  late FocusNode focusNode;
  late ScrollController _scrollController;

// Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatsProvider = Provider.of<ChatsProvider>(context);
    var dimensions = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
              elevation: 2,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(AssetsManager.theIcon)),
              ),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '',
                    // style: GoogleFonts.poppins(),
                  ),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      _deleteChatDialog(chatProvider: chatsProvider);
                    },
                    icon:
                        const Icon(Icons.delete_forever, color: Colors.white)),
                IconButton(
                    onPressed: () async {
                      await Services.showModalSheet(context: context);
                    },
                    icon: const Icon(Icons.more_vert_rounded,
                        color: Colors.white)),
              ]),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                          // addAutomaticKeepAlives: true,
                          // reverse: true,
                          // shrinkWrap: true,

                          controller: _scrollController,
                          itemCount: chatsProvider
                              .getChatList.length, //chatList.length,
                          itemBuilder: (context, index) {
                            return ChatWidget(
                              msg: chatsProvider.getChatList[index].msg,
                              chatIndex:
                                  chatsProvider.getChatList[index].chatIndex,
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (_isTyping) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          // SpinKitChasingDots(color: Colors.white, size: 18),
                          // SpinKitPulse(color: Colors.white, size: 18),
                          // SpinKitPulse(color: Colors.white, size: 18),
                          SpinKitThreeInOut(color: Colors.white, size: 18),
                        ],
                      )
                    ],
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(18),
                            bottomLeft: Radius.circular(18),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: cardColor,
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  textCapitalization: TextCapitalization.sentences,
                                  // focusNode: focusNode,
                                  onChanged: (value) {
                                    setState(() {
                                      textEditingController.text.isEmpty
                                          ? _isEnabled = false
                                          : _isEnabled = true;
                                    });
                                  },
                                  cursorHeight: 30,
                                  showCursor: true,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    height: 1.6,
                                    fontSize: 18,
                                  ),
                                  controller: textEditingController,
                                  onSubmitted: (value) async {
                                    //TODO send message
                                    await sendMessage(
                                        modelsProvider: modelsProvider,
                                        chatsProvider: chatsProvider);
                                    _isEnabled = false;
                                  },
                                  decoration: const InputDecoration.collapsed(
                                    border: InputBorder.none,
                                    hintText: 'How can I help you?',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: cardColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    // shape: BoxShape.rectangle,
                                    boxShadow: [
                                      // Shadow for top-left corner
                                      BoxShadow(
                                        color: Colors.grey[900]!,
                                        offset: const Offset(4.0, 4.0),
                                        blurRadius: 6.0,
                                        spreadRadius: 1,
                                      ),
                                      // Shadow for bottom-right corner
                                      const BoxShadow(
                                        color: Color(0xFF5A5A5A),
                                        offset: Offset(-5, -3),
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    onPressed: !_isEnabled
                                        ? null
                                        : () async {
                                            scrollDown();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();

                                            await sendMessage(
                                                modelsProvider: modelsProvider,
                                                chatsProvider: chatsProvider);
                                          },
                                    icon: Icon(
                                      Icons.send,
                                      color: !_isEnabled
                                          ? Colors.grey
                                          : Colors.teal[400],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  void scrollDown() {
    Timer(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 2), curve: Curves.easeInOut);
    });
  }

  Future<void> sendMessage(
      {required ModelsProvider modelsProvider,
      required ChatsProvider chatsProvider}) async {
    if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: TextWidget(label: "Wait for the response ;)"),
        backgroundColor: Colors.amber,
      ));
      return;
    }

    // !Another way to avoid sending void messages
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: TextWidget(label: "Please type a message"),
        backgroundColor: Colors.amber,
      ));
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(() {
        log('=================================== ${_scrollController.position.maxScrollExtent.toString()}');
        _isTyping = true;

        chatsProvider.addUserMessage(msg: msg);
        // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        textEditingController.clear();
        _isEnabled = false;
        // focusNode.unfocus();
      });
      await chatsProvider.allMessages(
          msg: msg, chosenModelId: modelsProvider.getCurrentModel);
      // await ApiService.getModels();
      // chatList.addAll(await ApiService.sendMessage(
      //     message: textEditingController.text,
      //     modelId: modelsProvider.currentModel));

      setState(() {});
    } catch (e) {
      log('El Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: e.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollDown();

        _isTyping = false;
      });
    }
  }

  Future<void> _deleteChatDialog({required ChatsProvider chatProvider}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: cardColor,
          title: const Text(
            'Eliminar chat',
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('¿Deseas eliminar el chat?',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  const Text('Cancelar', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text(
                'Eliminar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                chatProvider.deleteChat();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
