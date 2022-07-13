import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetPage extends StatefulWidget {
  const NetPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NetPageState();
}

class _NetPageState extends State<NetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("网络请求"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  getByHttpClient();
                },
                child: const Text("HttpClient Get请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  postByHttpClient();
                },
                child: const Text("HttpClient Post请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  getByHttp();
                },
                child: const Text("http get请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  postByHttp();
                },
                child: const Text("http post请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  getByDio();
                },
                child: const Text("Dio Get请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  cancelRequest();
                },
                child: const Text("Dio 取消Get请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  postByDio();
                },
                child: const Text("Dio Post请求"),
              ),
              OutlinedButton(
                onPressed: () {
                  postFormByDio();
                },
                child: const Text("Dio FormData提交"),
              ),
              OutlinedButton(
                onPressed: () {
                  getByHttpManager();
                },
                child: const Text("Dio 简单封装使用"),
              ),
              const Divider(),
              Text(_data),
            ],
          ),
        ),
      ),
    );
  }

  String _data = "";

  /// HttpClient get请求
  getByHttpClient() async {
    String result;
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
        result = responseBody;
      } else {
        result = "请求失败：${response.statusCode}";
      }
    } catch (exception) {
      result = "请求失败：$exception";
    }
    setState(() {
      _data = result;
    });
    if (kDebugMode) {
      print(result);
    }
  }

  /// HttpClient post请求
  postByHttpClient() async {
    String result = "";
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
        result = responseBody;
      } else {
        result = "请求失败：${response.statusCode}";
      }
    } catch (exception) {
      result = "请求失败：$exception";
    }
    setState(() {
      _data = result;
    });
    if (kDebugMode) {
      print(result);
    }
  }

  /// http get请求
  getByHttp() async {
    String result = "";
    const url = "https://www.wanandroid.com/article/list/0/json";
    var client = http.Client();
    try {
      http.Response response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        result = response.body;
      } else {
        result = "请求失败：${response.statusCode}";
      }
    } catch (exception) {
      result = "请求失败：$exception";
    }
    setState(() {
      _data = result;
    });
    if (kDebugMode) {
      print(result);
    }
  }

  /// http post请求
  postByHttp() async {
    String result = "";
    const url = "https://www.wanandroid.com/user/login";
    var client = http.Client();
    try {
      http.Response response =
          await client.post(Uri.parse(url), body: {"username": "Tom", "password": "123456"});
      if (response.statusCode == 200) {
        result = response.body;
      } else {
        result = "失败：${response.statusCode}";
      }
    } catch (exception) {
      result = "异常：$exception";
    }
    setState(() {
      _data = result;
    });
    if (kDebugMode) {
      print(result);
    }
  }

  CancelToken? token;

  /// Dio get请求
  getByDio() async {
    token = CancelToken();
    String result = "";
    const url = "https://www.wanandroid.com/article/list/0/json";
    var dio = Dio()..interceptors.add(MyInterceptor());
    try {
      Response response = await dio.get(url, cancelToken: token);
      result = response.data.toString();
    } on DioError catch (e) {
      if (e.response != null) {
        result = "请求失败：${e.response!.statusCode}";
      } else {
        result = "请求失败：$e";
      }
    }
    setState(() {
      _data = result;
    });
    if (kDebugMode) {
      print(result);
    }
  }

  /// Dio取消请求
  cancelRequest() {
    token?.cancel("cancelled");
  }

  /// dio post请求
  postByDio() async {
    String result = "";
    const url = "https://www.wanandroid.com/user/login";
    var dio = Dio();
    try {
      Response response =
          await dio.post<String>(url, data: {"username": "Tom", "password": "123456"});
      result = response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        result = "失败错误码：${e.response!.statusCode}";
      } else {
        result = "其他异常：$e";
      }
    }
    setState(() {
      _data = result;
    });
    if (kDebugMode) {
      print(result);
    }
  }

  /// Dio FormData提交
  postFormByDio() async {
    String result = "";
    const url = "https://www.wanandroid.com/user/login";
    var dio = Dio();
    var formData = FormData.fromMap({"username": "Tom", "password": "123456"});
    try {
      Response response = await dio.post<String>(url, data: formData);
      result = response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        result = "失败错误码：${e.response!.statusCode}";
      } else {
        result = "其他异常：$e";
      }
    }
    setState(() {
      _data = result;
    });
    if (kDebugMode) {
      print(result);
    }
  }

  /// Dio简单封装使用
  getByHttpManager() async {
    String result = "";
    const url = "https://www.wanandroid.com/article/list/0/json";
    try {
      Response response = await HttpManager().client.get(url);
      result = response.data.toString();
    } on DioError catch (e) {
      if (e.response != null) {
        result = "失败错误码：${e.response!.statusCode}";
      } else {
        result = "其他异常：$e";
      }
    }
    setState(() {
      _data = result;
    });
  }
}

class MyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("请求前调用");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("响应后调用");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("发生异常时调用");
    super.onError(err, handler);
  }
}

class HttpManager {
  static const CONNECT_TIMEOUT = 50000;
  static const RECEIVE_TIMEOUT = 30000;

  static HttpManager? _instance;

  late Dio _dio;

  Dio get client => _dio;

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
    _dio = Dio(options)
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
  }
}
