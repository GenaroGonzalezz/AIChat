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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Material(
              color: chatIndex == 0 ? theScaffoldBackgroundColor : cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                                    child: Image.asset(
                                      AssetsManager.userImage,
                                      width: deviceData.width * 0.11,
                                      height: deviceData.height * 0.05,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Expanded(
                              child: Container(
                                // decoration: BoxDecoration(
                                //   color: theScaffoldBackgroundColor,
                                //   borderRadius: BorderRadius.circular(24),
                                //   boxShadow: [
                                //   // Shadow for top-left corner
                                //   BoxShadow(
                                //     color: theScaffoldBackgroundColor,
                                //     offset: Offset(10, 10),
                                //     blurRadius: 30,
                                //     spreadRadius: 1,
                                //   ),
                                //   // Shadow for bottom-right corner
                                //   BoxShadow(
                                //     color: theScaffoldBackgroundColor,
                                //     offset: Offset(-10, -10),
                                //     blurRadius: 30,
                                //     spreadRadius: 1,
                                //   ),
                                // ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Material(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.circular(28),
                                      child: Image.asset(
                                        AssetsManager.openAiLogo,
                                        width: deviceData.width * 0.11,
                                        height: deviceData.height * 0.05,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                        child:
                                            // chatIndex == 0
                                            //     ?

                                            TextWidget(
                                      label: msg,
                                    )
                                        // :
                                        // DefaultTextStyle(
                                        //   style: const TextStyle(
                                        //     color: Colors.white,
                                        //     fontWeight: FontWeight.w400,
                                        //     fontSize:16,
                                        //   ),
                                        //   child: AnimatedTextKit(
                                        //     isRepeatingAnimation: false,
                                        //     displayFullTextOnTap: true,
                                        //     repeatForever: false,
                                        //     totalRepeatCount: 1,
                                        //       animatedTexts: [
                                        //         TyperAnimatedText(
                                        //           msg.trim(),
                                        //         )
                                        //       ],
                                        //     ),
                                        // ),
                                        ),
                                  ],
                                ),
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
