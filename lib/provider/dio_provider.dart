import 'dart:convert';

import 'package:dio/dio.dart';

class DioProvider {
  final Dio _dio;
  DioProvider() : _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/api/'));

 //busca o tokem

  Future<dynamic> getToken(String email, String password) async{
    try{
      var response = await _dio.post('login',
        data: {'email':email, 'password':password});

        // se a resposta for bem sucedida retorna o token
        if (response.statusCode == 200 && response.data != ''){
          print('Token recebido: ${response.data}');
          return response.data;
        }else { print('Erro ao obter token: ${response.statusCode}'); return null;
        }

    }catch(error){
      print('Erro na solicitação: $error');
      return error;
    }
  }
  //pega os dados do usuario
  Future<dynamic>getUser(String token) async{
    try {
      var user = await _dio.get('user',
      options: Options(headers: {'Authorization':'Bearer $token'}));

      if (user.statusCode == 200 && user.data != '') {
        print('Dados do usuário recebidos: ${user.data}');
        return user.data;
      }else { print('Erro ao obter dados do usuário: ${user.statusCode}'); return null;
      }
    } catch (error) {
      print('Erro na solicitação: $error');
      return error;
    }
  }
}