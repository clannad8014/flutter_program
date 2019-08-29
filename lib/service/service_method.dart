import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/server_url.dart';
//获取音乐信息
Future getMusicThing() async{
  try{
    print('开始获取首页数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
    var formData = {'lon':'115.02932','lat':'35.76189'};
    response = await dio.post(servicePath['novel'],data:formData);
    // response = await dio.get("https://gank.io/api/data/福利/10/1");
    if(response.statusCode==200){
      print(response.data);
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }

}
//====================================
Future request(url,{formData})async{
    try{
      print('开始获取数据...............');
      Response response;
      Dio dio = new Dio();
      // dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
      if(formData==null){
          //  response=await dio.get("https://api.apiopen.top/getJoke?page=1&count=1&type=video");
     
          response = await dio.get(url);
      }else{
        //  response = await dio.get(url);
         print('forData: '+formData.toString());
         response = await dio.post('https://api.apiopen.top/searchMusic?'+formData.toString());
          // response = await dio.post(url,data:formData);
          // String urls=url+formData.toString();
          //  response = await dio.get(servicePath[url]+formData);
          // print(response.data);
      }
      if(response.statusCode==200){
        return response.data;
      }else{
          throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
        return print('ERROR:======>${e}');
    }
     
}

//请求登录数据
Future requestLogin (formData)async{
     try{
      print('开始获取login数据...............');
      Response response;
      Dio dio = new Dio();
      response = await dio.post(serviceApiPath["login"], data: formData);
      print(response.data);
      if(response.statusCode==200){
        return response.data;
      }else{
          throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
        formatError(e);
        return print('ERROR:======>${e}');
    }
}
//请求登录notice
Future requestNotice(formData)async{
     try{
      print('开始获取notice数据...............');
      Response response;
      Dio dio = new Dio();
      response = await dio.post(serviceApiPath["notice"], data: formData);
      print(response.data);
      
      if(response.statusCode==200){
        return response.data;
      }else{
          throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
        formatError(e);
        return print('ERROR:======>${e}');
    }
}

//请求登录unit
Future requestUnit(formData)async{
     try{
      print('开始获取unit数据...............');
      Response response;
      Dio dio = new Dio();
      response = await dio.post(serviceApiPath["unit"], data: formData);
      print(response.data);
      
      if(response.statusCode==200){
        return response.data;
      }else{
          throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
        formatError(e);
        return print('ERROR:======>${e}');
    }
}

 
Future requestApi(url,formData)async{
     try{
      print('开始获取${url}数据...............');
      Response response;
      Dio dio = new Dio();
      response = await dio.post(serviceApiPath["${url}"], data: formData);
      // print(response.data);
      
      if(response.statusCode==200){
        return response.data;
      }else{
          throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
        formatError(e);
        return print('ERROR:======>${e}');
    }
}
//=============================================
 void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }

 