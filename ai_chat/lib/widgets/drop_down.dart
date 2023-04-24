import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ModelsDropdownWidget extends StatefulWidget {
  const ModelsDropdownWidget({super.key});

  @override
  State<ModelsDropdownWidget> createState() => _ModelsDropdownWidgetState();
}

class _ModelsDropdownWidgetState extends State<ModelsDropdownWidget> {
  String currentModel = "Model1";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      // underline: SizedBox.shrink(),
      borderRadius: BorderRadius.circular(16),
      dropdownColor: theScaffoldBackgroundColor,
      iconEnabledColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      items: getModelsItem,
      value: currentModel,
      onChanged: (value) {
        setState(() {
          currentModel = value.toString();
          print(currentModel);
        });
      },
    );
  }
}
