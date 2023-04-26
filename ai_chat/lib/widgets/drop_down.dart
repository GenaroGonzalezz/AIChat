import 'package:ai_chat/models/models_model.dart';
import 'package:ai_chat/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/models_provider.dart';
import '../services/api_service.dart';

class ModelsDropdownWidget extends StatefulWidget {
  const ModelsDropdownWidget({super.key});

  @override
  State<ModelsDropdownWidget> createState() => _ModelsDropdownWidgetState();
}

class _ModelsDropdownWidgetState extends State<ModelsDropdownWidget> {
  String currentModel = "babbage";

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    return FutureBuilder<List<ModelsModel>>(
        future: modelsProvider.getAllModels(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: TextWidget(label: snapshot.error.toString()));
          }
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : Expanded(
                child: DropdownButton(
                  isExpanded: true,
                  // underline: SizedBox.shrink(),
                  borderRadius: BorderRadius.circular(16),
                  dropdownColor: theScaffoldBackgroundColor,
                  iconEnabledColor: Colors.white,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  items: List<DropdownMenuItem<String>>.generate(
                      snapshot.data!.length,
                      (index) => DropdownMenuItem(
                          value: snapshot.data![index].id,
                          child: TextWidget(
                            label: snapshot.data![index].id,
                            fontSize: 15,
                          ))),
                  value: currentModel,
                  onChanged: (value) {
                    setState(() {
                      currentModel = value.toString();
                      print(currentModel);
                    });
                  },
                ),
              );
        });
  }
}

/* 
DropdownButton(
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
 */