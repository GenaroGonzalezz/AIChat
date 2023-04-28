import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/chat_models.dart';
import '../services/api_service.dart';

class ChatsProvider with ChangeNotifier {
  final List<List<ChatModel>> _chatHistory = [];

  final List<ChatModel> _chatList = [];
  List<ChatModel> get getChatList {
    return _chatList;
  }

  List<List<ChatModel>> get getChatHistory {
    return _chatHistory;
  }

  void addUserMessage({required String msg}) {
    _chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> allMessages(
      {required String msg, required String chosenModelId}) async {
    _chatList.addAll(
        await ApiService.sendMessage(message: msg, modelId: chosenModelId));

    notifyListeners();
  }

  void deleteChat() {
    // _chatHistory.add(_chatList);
    // List<List<int>> listOfLists = [];
    // List<List<int>> listaDeListas = [
    //   [1, 2],
    //   [5, 8],
    //   [1, 3],
    //   [4, 9]
    // ];
    // ChatModel lDl = ChatModel(msg: 'Alo', chatIndex: 1);
    // ChatModel lDl2 = ChatModel(msg: 'Jeje', chatIndex: 3);
    // ChatModel lDl3 = ChatModel(msg: 'Noup', chatIndex: 4);
    // ChatModel lDl4 = ChatModel(msg: 'Aye sir', chatIndex: 8);
    // ChatModel lDl5 = ChatModel(msg: 'Cuando', chatIndex: 5);
    // List<List<ChatModel>> historial = [
    //   [lDl, lDl2, lDl3],
    //   [lDl4, lDl5]
    // ];

    // print(historial);
    // print(listaDeListas);

    // print(_chatHistory);

    _chatList.clear();

    notifyListeners();
  }
}
