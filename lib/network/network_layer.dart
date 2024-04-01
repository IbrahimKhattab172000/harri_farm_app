// ignore_for_file: constant_identifier_names, prefer_final_fields, no_leading_underscores_for_local_identifiers, deprecated_member_use, unnecessary_string_interpolations

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harri_farm_app/app_config/app_config.dart';
import 'package:harri_farm_app/core/app_storage.dart';
import 'package:harri_farm_app/network/mapper.dart';
import 'package:harri_farm_app/network/network_logger.dart';
import 'package:harri_farm_app/utility/utility.dart';

enum ServerMethods { GET, POST, UPDATE, DELETE, PUT, PATCH }

class Network {
  static Network? _instance;
  static String? lang;
  static Dio _dio = Dio();
  bool isActiveUser = true;
  Network._private();

  factory Network() {
    if (_instance == null) {
      _dio.options.connectTimeout = const Duration(seconds: 60);
      _dio.interceptors.add(NetworkLogger.logger);
      _instance = Network._private();
    }
    return _instance!;
  }

  Future<dynamic> request(
    String endpoint, {
    body,
    Mapper? model,
    Map<String, dynamic>? query,
    Map<String, dynamic>? header,
    ServerMethods method = ServerMethods.GET,
  }) async {
    String? _token = AppStorage.getToken;

    _dio.options.headers = {
      if (_token != null) 'Authorization': 'Bearer $_token',
      'Accept': 'application/json',
      "User-Agent": "Dart",
      'Accept-Language': lang,
    };
    if (header != null) {
      _dio.options.headers.addAll(header);
    }
    try {
      Response response = await _dio.request(
        AppConfig.BASE_URL + endpoint,
        data: body,
        queryParameters: query,
        options: Options(
          method: method.name,
        ),
      );
      isActiveUser = true;
      if (model == null) {
        return response;
      } else {
        return Mapper(model, response.data);
      }
    } on SocketException catch (e) {
      cprint(
        "SocketException: ${e.address}",
        errorIn: AppConfig.BASE_URL + endpoint,
        label: "SocketException",
      );
      cprint(
          "└------------------------------------------------------------------------------");
      cprint(
          "================================================================================");
      rethrow;
    } on DioError catch (e) {
      cprint(
        "| Error: ${e.error}: ${e.response?.toString()}",
        errorIn: "${AppConfig.BASE_URL + endpoint}",
        label: "DioError",
      );
      cprint(
          "└------------------------------------------------------------------------------");
      cprint(
          "================================================================================");
      if (model == null) {
        return e.response;
      } else {
        return Mapper(model, e.response?.data);
      }
    } catch (error) {
      cprint(
        "Unhandled Exception: $error",
        errorIn: AppConfig.BASE_URL + endpoint,
        label: "Unhandled Exception",
      );
      cprint(
          "└------------------------------------------------------------------------------");
      cprint(
          "================================================================================");
      rethrow;
    }
  }
}
