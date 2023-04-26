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
                // DropdownButton(
                //   borderRadius: BorderRadius.circular(15),
                //   dropdownColor: cardColor,
                //   enableFeedback: true,
                //   underline: const SizedBox.shrink(),
                //   // focusColor: Colors.white,
            
                //   style: TextStyle(
                //     backgroundColor: cardColor,
                //     color: Colors.white,
                //     fontSize: 16,
                //   ),
                //   // Initial Value
                //   value: dropdownvalue,
            
                //   // Down Arrow Icon
                //   icon: const Icon(
                //       Icons.arrow_drop_down_circle_outlined),
                //   iconEnabledColor: Colors.grey,
            
                //   // Array list of items
                //   items: items.map((String items) {
                //     return DropdownMenuItem(
                //       value: items,
                //       child: Text(items),
                //     );
                //   }).toList(),
                //   // After selecting the desired option,it will
                //   // change button value to selected value
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownvalue = newValue!;
                //     });
                //   },
                // ),
              ],
            ),
          );
        });
  }
}
