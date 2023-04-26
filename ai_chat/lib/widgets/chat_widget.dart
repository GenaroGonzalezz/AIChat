import 'package:ai_chat/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/constants.dart';
import '../services/assets_manager.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Material(
              color: chatIndex == 0 ? theScaffoldBackgroundColor : cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      chatIndex == 0
                          ? Image.asset(
                              AssetsManager.userImage,
                              // height: deviceData.height * 0.15,
                              width: deviceData.width * 0.12,
                            )
                          : Material(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(28),
                              child: Image.asset(
                                AssetsManager.openAiLogo,
                                width: deviceData.width * 0.11,
                                height: deviceData.height * 0.05,
                              ),
                            ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextWidget(
                          label: msg,
                        ),
                      ),
                      // chatIndex == 0
                      //     ? SizedBox.shrink()
                      //     : Row(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: const[
                      //         Icon(Icons.thumb_up_alt_outlined, color: Colors.white,),
                      //         Icon(Icons.thumb_down_alt_outlined, color: Colors.white,),
                      //       ]),
                    ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
