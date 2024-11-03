import "package:dio/dio.dart";

import "../local_source/local_storage.dart";

class ClientInterceptor extends Interceptor {
  @override
  void onRequest(options, handler) {
    options.headers = {
      // "Accept-Language": DataStore.instance.lang,
      // "Content-Type": Headers.jsonContentType,
      // "Content-Type":"text/html",
      // "Authorization": 'Bearer ${DataStore.instance.token ?? ''}',
      // "Authorization":  'Bearer ${DataStore.instance.token ?? ''}',
      // "Accept": Headers.jsonContentType,
      // "Accept": '*/*',
      // "AcceptApplication/json": Headers.jsonContentType,

      'Accept': 'application/json',
      // 'version': DataStore.instance.getVersion ?? "",
      'Authorization': LocalStorage().getToken != null
          ? 'Bearer ${LocalStorage().getToken}'
          : '',
    };
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data == "error") {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: response.data["msg"] ?? response.data["message"],
          type: DioExceptionType.badResponse,
        ),
      );
    } else {
      handler.resolve(response);
    }
  }
}
