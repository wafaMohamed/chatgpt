import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:chatgpt/models/chat_model.dart';
import 'package:chatgpt/models/models_model.dart';
import 'package:http/http.dart' as http;
import '../constants/api_const.dart';
import 'package:logger/logger.dart';

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$baseUrl/models"),
        headers: {
          "Authorization": "Bearer $apiKey",
        },
      );
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        print(jsonResponse['error']["message"]);
        throw HttpException(jsonResponse['error']["message"]);
      }
      //print(jsonResponse , $jsonResponse);
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        //log("temp ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      Logger().e("error $error");
      rethrow;
    }
  }

  //send Message
  static Future<List<ChatModel>> sendMessage(
      {required String message, required String modelId}) async {
    try {
      log('modelId $modelId');
      var response = await http.post(
        Uri.parse('$baseUrl/completions'),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': "text-davinci-003",
          'prompt': message,
          'max_tokens': 100,
          'temperature': 0,

        }),
      );
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        print(jsonResponse['error']['message']);
        throw HttpException(jsonResponse['error']['message']);
      }
      List<ChatModel> chatList = [];
      if (jsonResponse['choices'].length > 0) {
        chatList = List.generate(jsonResponse['choices'].length, (index) =>
            ChatModel(msg: jsonResponse['choices'][index]['text'], chatIndex: 1));
      }return chatList;
    } catch (error) {
      log('error $error');
      rethrow;
    }
  }
}

