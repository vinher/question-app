import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:question_app/domain/entyties/message.dart';

class GetYesNoanswer{
 
  final _dio = Dio();

  Future<Message> getAnswer() async{
     deactivate();
    final response = await _dio.get('https://fakestoreapi.com/products');
    print(response.data);
    print(response.data[0]['id']);
    print(response.data[0]['image']);
    return Message(text: response.data[0]['title'], fromWho: FromWho.hers, imgUrl:response.data[0]['image']);

  }

   deactivate(){
    // ignore: deprecated_member_use
    (Dio().httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  }
}