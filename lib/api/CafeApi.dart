import 'package:dio/dio.dart';
import 'package:dashboard_backend/services/local_storage.dart';

class CafeApi {
  static Dio _dio = Dio();

  static void configureDio() {
    //base url
    _dio.options.baseUrl = "http://localhost:8080/api";
    // configurar headers
    _dio.options.headers = {
      "x-token": LocalStorage.prefs.getString("token") ?? ""
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } catch (e) {
      print(e);
      throw ("Error en el get");
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      print(e);
      throw ("Error en el POST");
    }
  }
}
