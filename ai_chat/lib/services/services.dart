import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/widgets.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        elevation: 10,
        useSafeArea: true,
        barrierColor: cardColor.withOpacity(0.8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        backgroundColor: theScaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(18.0),
            child: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Flexible(
                    child: TextWidget(
                      label: "Chosen Model: ",
                      fontSize: 16,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: ModelsDropdownWidget(),
                  ),
                  
                  
                ],
              ),
            ),
          );
        });
  }
}
