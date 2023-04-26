import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/constants.dart';
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
  final bool _isTyping = true;

  late TextEditingController textEditingController;

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
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            elevation: 2,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AssetsManager.openAiLogo3),
            ),
            title: const Text('ChatGPT'),
            actions: [
              IconButton(
                  onPressed: () async {
                    await Services.showModalSheet(context: context);
                  },
                  icon:
                      const Icon(Icons.more_vert_rounded, color: Colors.white)),
            ]),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20),
              //   color: cardColor,
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey.withOpacity(0.2),
              //       spreadRadius: 5,
              //       blurRadius: 7,
              //       offset: const Offset(0, 3),
              //     ),
              //   ],
              // ),
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                        itemCount: chatMessages.length,
                        itemBuilder: (context, index) {
                          return ChatWidget(
                            msg: chatMessages[index]["msg"].toString(),
                            chatIndex: int.parse(
                                chatMessages[index]["chatIndex"].toString()),
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
                        SpinKitPulse(color: Colors.white, size: 18),
                        SpinKitPulse(color: Colors.white, size: 18)
                      ],
                    )
                  ],
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextField(decoration: InputDecoration(
                  //     suffixIcon: IconButton(onPressed: (){

                  //       print('Enviar');
                  //       setState(() {

                  //       });
                  //       }, icon: const Icon(Icons.send))
                  //   )),
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(18),
                      color: cardColor,
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                cursorHeight: 30,
                                showCursor: false,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                controller: textEditingController,
                                onSubmitted: (value) {
                                  //TODO send message
                                },
                                decoration: const InputDecoration.collapsed(
                                  hintText: 'How can I help you?',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                try {
                                  await ApiService.getModels();
                                } catch (e) {
                                  log('El Error: $e');
                                }
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ),
            ],
          ),
        ));
  }
}
