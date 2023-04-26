import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_chat/constants/constants.dart';
import 'package:ai_chat/models/models_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    //TODO Poner tipo de dato List<ModelsModel>
    try {
      var response = await http.get(Uri.parse("$BASE_URL/models"), headers: {
        'Authorization': 'Bearer $API_KEY',
        "Content-Type": "application/json",
      });

      Map<dynamic, dynamic> jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(
            "Message: ${jsonResponse['error']['message']} - Type: ${jsonResponse['error']['type']}");
      }
      print("jsonResponse $jsonResponse");
      List<dynamic> temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        log("temp ${value["id"]}");
      }
      // log("Jeje ${ModelsModel.modelsFromSnapshot(temp).toString()}");
      // return jsonResponse;
      return ModelsModel.modelsFromSnapshot(
          temp); //TODO Retornar el ModelsModel
    } catch (error) {
      // log('Error: ${error.toString()}');
      rethrow;
    }
  }
}
