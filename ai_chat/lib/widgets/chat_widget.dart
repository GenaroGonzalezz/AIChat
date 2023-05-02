import 'package:ai_chat/screens/chat_screen.dart';
import 'package:ai_chat/widgets/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/constants.dart';
import '../services/assets_manager.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(),
            // borderRadius: BorderRadius.circular(18),
            child: Material(
              color: theScaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  chatIndex == 0
                      ? Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                  fit: FlexFit.loose,
                                  child: TextWidget(
                                    label: msg,
                                  )),
                              const SizedBox(width: 10),
                              Material(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(28),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Image.asset(
                                    AssetsManager.human,
                                    width: deviceData.width * 0.11,
                                    height: deviceData.height * 0.05,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: theScaffoldBackgroundColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              // shape: BoxShape.rectangle,
                              boxShadow: [
                                // Shadow for top-left corner
                                BoxShadow(
                                  color: Colors.grey[900]!,
                                  offset: const Offset(8.0, 5.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1,
                                ),
                                // Shadow for bottom-right corner
                                const BoxShadow(
                                  color: Color(0xFF444444),
                                  offset: Offset(-10, -8),
                                  blurRadius: 14,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Stack(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Material(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(28),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Image.asset(
                                        AssetsManager.theia,
                                        width: deviceData.width * 0.11,
                                        height: deviceData.height * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(30),
                                    // padding: EdgeInsets.only(right: deviceData.width/18, bottom: deviceData.height/30),
                                    child: Column(
                                      children: [
                                        TextWidget(
                                          label: msg,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
