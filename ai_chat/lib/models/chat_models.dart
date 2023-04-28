class ChatModel {
  final String msg;
  final int chatIndex;

  ChatModel({required this.msg, required this.chatIndex});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        msg: json["msg"],
        chatIndex: json["chatIndex"],
      );

      static List<ChatModel> modelsFromSnapshot(List<dynamic> chatSnapshot) {
    return chatSnapshot.map((data) => ChatModel.fromJson(data)).toList();
  }
}
