import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NetPageState();
}

class _NetPageState extends State<NetPage> {
  String _data = "";

  /// HttpClient get请求
  getByHttpClient() async {
    String _result;
    var httpClient = HttpClient();
    try {
      final uri = Uri(
        scheme: "https",
        host: "www.wanandroid.com",
        path: "article/list/0/json",
      );
      HttpClientRequest request = await httpClient.getUrl(uri);
      HttpClientResponse response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        String responseBody = await response.transform(utf8.decoder).join();
        _result = responseBody;
      } else {
        _result = "失败：${response.statusCode}";
      }
    } catch (exception) {
      _result = "异常：$exception";
    }
    print("HttpClient get请求=====================");
    print(_result);
    print("HttpClient get请求=====================");
    setState(() {
      _data = _result;
    });
  }

  /// HttpClient post请求
  postByHttpClient() async {
    String _result = "";
    var httpClient = HttpClient();
    try {
      final uri = Uri(
          scheme: "https",
          host: "www.wanandroid.com",
          path: "user/login",
          queryParameters: {"username": "Tom", "password": "123456"});
      HttpClientRequest request = await httpClient.postUrl(uri);
      HttpClientResponse response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        String responseBody = await response.transform(utf8.decoder).join();
        _result = responseBody;
      } else {
        _result = "失败：${response.statusCode}";
      }
    } catch (exception) {
      _result = "异常：$exception";
    }
    print("HttpClient post请求=====================");
    print(_result);
    print("HttpClient post请求=====================");
    setState(() {
      _data = _result;
    });
  }

  /// http get请求
  getByHttp() async {
    String _result = "";
    const url = "https://www.wanandroid.com/article/list/0/json";
    var client = http.Client();
    try {
      http.Response response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _result = response.body;
      } else {
        _result = "失败：${response.statusCode}";
      }
    } catch (exception) {
      _result = "异常：$exception";
    }

    print("http get请求=====================");
    print(_result);
    print("http get请求=====================");
    setState(() {
      _data = _result;
    });
  }

  /// http post请求
  postByHttp() async {
    String _result = "";
    const url = "https://www.wanandroid.com/user/login";
    var client = http.Client();
    try {
      http.Response response = await client.post(Uri.parse(url), body: {"username": "Tom", "password": "123456"});
      if (response.statusCode == 200) {
        _result = response.body;
      } else {
        _result = "失败：${response.statusCode}";
      }
    } catch (exception) {
      _result = "异常：$exception";
    }

    print("http post请求=====================");
    print(_result);
    print("http post请求=====================");
    setState(() {
      _data = _result;
    });
  }

  CancelToken? token;

  /// dio get请求
  getByDio() async {
    token = dio.CancelToken();
    String _result = "";
    const url = "https://www.wanandroid.com/article/list/0/json";
    var client = dio.Dio()..interceptors.add(MyInterceptor());
    try {
      dio.Response response = await client.get(url, cancelToken: token);
      _result = response.data.toString();
    } on dio.DioError catch (e) {
      if (e.response != null) {
        _result = "失败错误码：${e.response!.statusCode}";
      } else {
        _result = "其他异常：$e";
      }
    }

    print("dio get请求=====================");
    print(_result);
    print("dio get请求=====================");
    setState(() {
      _data = _result;
    });
  }

  cancelRequest() {
    token?.cancel("cancelled");
  }

  /// 简单封装使用
  get2() async {
    String _result = "";
    const url = "https://www.wanandroid.com/article/list/0/json";
    try {
      dio.Response response = await HttpManager().client.get(url);
      _result = response.data.toString();
    } on dio.DioError catch (e) {
      if (e.response != null) {
        _result = "失败错误码：${e.response!.statusCode}";
      } else {
        _result = "其他异常：$e";
      }
    }
    print("dio get请求=====================");
    print(_result);
    print("dio get请求=====================");
    setState(() {
      _data = _result;
    });
  }

  /// dio post请求
  postByDio() async {
    String _result = "";
    const url = "https://www.wanandroid.com/user/login";
    var client = dio.Dio();
    try {
      dio.Response response =
          await client.post<String>(url, queryParameters: {"username": "Tom", "password": "123456"});
      _result = response.data;
    } on dio.DioError catch (e) {
      if (e.response != null) {
        _result = "失败错误码：${e.response!.statusCode}";
      } else {
        _result = "其他异常：$e";
      }
    }

    print("dio post请求=====================");
    print(_result);
    print("dio post请求=====================");
    setState(() {
      _data = _result;
    });
  }

  /// FormData
  postByDio2() async {
    String _result = "";
    const url = "https://www.wanandroid.com/user/login";
    var client = dio.Dio();
    var formData = dio.FormData.fromMap({"username": "Tom", "password": "123456"});
    try {
      dio.Response response = await client.post<String>(url, data: formData);
      _result = response.data;
    } on dio.DioError catch (e) {
      if (e.response != null) {
        _result = "失败错误码：${e.response!.statusCode}";
      } else {
        _result = "其他异常：$e";
      }
    }

    print("dio FormData=====================");
    print(_result);
    print("dio FormData=====================");
    setState(() {
      _data = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络请求"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  getByHttpClient();
                },
                child: Text("HttpClient get请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  postByHttpClient();
                },
                child: Text("HttpClient post请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  getByHttp();
                },
                child: Text("http get请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  postByHttp();
                },
                child: Text("http post请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  getByDio();
                },
                child: Text("dio get请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  cancelRequest();
                },
                child: Text("dio 取消get请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  postByDio();
                },
                child: Text("dio post请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  postByDio2();
                },
                child: Text("dio FormData提交"),
              ),
              OutlinedButton(
                onPressed: () {
                  get2();
                },
                child: Text("dio 简单封装使用"),
              ),
              const Divider(),
              Text(_data),
            ],
          ),
        ),
      ),
    );
  }
}

class MyInterceptor extends dio.Interceptor {
  @override
  void onRequest(dio.RequestOptions options, dio.RequestInterceptorHandler handler) {
    print("请求前调用");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(dio.Response response, dio.ResponseInterceptorHandler handler) {
    print("响应后调用");
    super.onResponse(response, handler);
  }

  @override
  void onError(dio.DioError err, dio.ErrorInterceptorHandler handler) {
    print("发生异常时调用");
    super.onError(err, handler);
  }
}

class HttpManager {
  static const CONNECT_TIMEOUT = 50000;
  static const RECEIVE_TIMEOUT = 30000;

  static HttpManager? _instance;

  late dio.Dio _client;

  dio.Dio get client => _client; // dio.Dio? get getClient => _client;

  factory HttpManager() => _getInstance();

  static _getInstance() {
    _instance ??= HttpManager._create();
    return _instance;
  }

  HttpManager._create() {
    var options = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
    );
    _client = dio.Dio(options)..interceptors.add(dio.LogInterceptor());
  }
}
