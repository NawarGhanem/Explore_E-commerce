import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import '../../constants/api_const.dart';
import '../local_source/local_storage.dart';
import 'dio_errors_handler.dart';
import 'interceptors_handler.dart';

class BaseApiClient {
  static Dio client = Dio(); // static for using in this class only
  static CancelToken getTargetCancelToken = CancelToken();
  static final Map<String, String> _headers = {
    'Accept': 'application/json',
    // 'version': DataStore.instance.getVersion ?? "",
    'Authorization': LocalStorage().getToken != null
        ? 'Bearer ${LocalStorage().getToken}'
        : '',
    // 'lang' : DataStore.instance.lang,
  };

  BaseApiClient() {
    client.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("================================================");
        print("Request Headers: ${options.headers}");
        print("================================================");
        return handler.next(options);
      },
    ));
    client.interceptors.add(LogInterceptor());
    client.interceptors.add(ClientInterceptor());
    client.options.baseUrl = ApiConst.baseUrl;
    client.options.sendTimeout = const Duration(seconds: 5);
    client.options.headers = _headers;
    client.options.connectTimeout = const Duration(seconds: 5);
  }

  static Future<Either<String, T>> post<T>(
      {required String url,
      dynamic formData,
      Map<String, dynamic>? queryParameters,
      /* localhost/ route=/table/structure..... example of this*/
      required T Function(dynamic) converter,
      /* convert the model to json*/
      bool isToken = false,
      /*if the req need token  */
      dynamic returnOnError}) async {
    try {
      var response = await client.post(
        url,
        queryParameters: queryParameters,
        data: formData,
        onSendProgress: (int sent, int total) {
          if (kDebugMode) {
            print(
                'progress: ${(sent / total * 100).toStringAsFixed(0)}% ($sent/$total)');
          }
        },
        options: Options(
          headers: _headers,
        ),
      );
      if (((response.statusCode! >= 200 && response.statusCode! <= 205)) &&
          (response.data['error'].toString() != 'true') &&
          (response.data['status'].toString() !=
              'Error')) /* to insure that the status isn't error 
          */
      {
        if (kDebugMode) {
          log(response.data.toString());
        }
        if (isToken) {
          // DataStore.instance.setToken(response.headers['Authorization']!.first);
        }
        return right(converter(response.data));
      } else {
        return left(response.data['message']);
      }
    } on DioException catch (e) {
      Map dioError = DioErrorsHandler.onError(e);
      if (kDebugMode) {
        print(e);
      }

      // if the user is Unauthenticated redirect to login
      if (dioError['statusCode'] == 401) {
        goTOLogin();
        return left(dioError['message']);
      }
      if (dioError['statusCode'] == 423) {
        goTOSuspended();
        return left(dioError['message']);
      }

      return left(returnOnError ?? dioError["message"] ?? '');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left("");
    }
  }

  static Future<Either<String, T>> put<T>(
      {required String url,
      dynamic formData,
      Map<String, dynamic>? queryParameters,
      required T Function(dynamic) converter,
      dynamic returnOnError}) async {
    try {
      var response = await client.put(
        url,
        data: formData,
        queryParameters: queryParameters,
        onSendProgress: (int sent, int total) {
          if (kDebugMode) {
            print(
                'progress: ${(sent / total * 100).toStringAsFixed(0)}% ($sent/$total)');
          }
        },
        options: Options(
          headers: _headers,
        ),
      );
      if (((response.statusCode! >= 200 && response.statusCode! <= 205)) &&
          (response.data['error'].toString() != 'true')) {
        if (kDebugMode) {
          log(response.data.toString());
        }
        return right(converter(response.data));
      } else {
        return left(response.data['message']);
      }
    } on DioException catch (e) {
      Map dioError = DioErrorsHandler.onError(e);
      if (kDebugMode) {
        print(e);
      }

      // if the user is Unauthenticated redirect to login
      if (dioError['statusCode'] == 401) {
        goTOLogin();
        return left(dioError['message']);
      }
      if (dioError['statusCode'] == 423) {
        goTOSuspended();
        return left(dioError['message']);
      }

      return left(returnOnError ?? dioError["message"] ?? '');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left("");
    }
  }

  static Future<Either<String, T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) converter,
  }) async {
    try {
      var response = await client.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: _headers,
        ),
        cancelToken: getTargetCancelToken,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 205) {
        if (kDebugMode) {
          print('_____________________________');
          log(url);

          log(response.data.toString());
          print(response);
          print('_____________________________');
        }
        return right(converter(response.data));
      } else {
        return left(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        return left('cancel');
      }
      Map dioError = DioErrorsHandler.onError(e);
      if (kDebugMode) {
        print(e);
      }

      // if the user is Unauthenticated redirect to login
      if (dioError['statusCode'] == 401) {
        goTOLogin();
        return left(dioError['message']);
      }
      if (dioError['statusCode'] == 423) {
        goTOSuspended();
        return left(dioError['message']);
      }

      return left(dioError['message']);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left("");
    }
  }

  static Future<Either<String, T>> delete<T>(
      {required String url,
      Map<String, dynamic>? queryParameters,
      required Function(dynamic) converter}) async {
    try {
      var response = await client.delete(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: _headers,
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 205) {
        if (kDebugMode) {
          log(response.data.toString());
          print(response);
        }
        return right(converter(response.data));
      } else {
        return left(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        return left('Cancel');
      }
      Map dioError = DioErrorsHandler.onError(e);
      if (kDebugMode) {
        print(e);
      }

      // if the user is Unauthenticated redirect to login
      if (dioError['statusCode'] == 401) {
        goTOLogin();
        return left(dioError['message']);
      }
      if (dioError['statusCode'] == 423) {
        goTOSuspended();
        return left(dioError['message']);
      }

      return left(dioError['message']);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left("");
    }
  }

  // Method to cancel any ongoing request
  static void cancelRequest() {
    if (!getTargetCancelToken.isCancelled) {
      getTargetCancelToken.cancel();
      getTargetCancelToken = CancelToken(); // Reset the cancel token
    }
  }

  static void goTOLogin() {
    // Get.back until dialog is closed
    // LocalStorage().clearToken();
    // Get.put(LoginController());
    // Get.offAll(() => LoginView());
  }

  static void goTOSuspended() {
    // TODO : Baraa
    // Get.back until dialog is closed
    // Get.back
    // LocalStorage().clearToken();
    // Get.put(AccountSuspendedView());
    // Get.offAll(() => AccountSuspendedView());
  }
}
