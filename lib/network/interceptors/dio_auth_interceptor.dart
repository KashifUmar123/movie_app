import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movieapp/utils/servcies/firebase_remote_config_service.dart';

class AuthInterceptor extends Interceptor {
  final RemoteConfigService configService;
  AuthInterceptor(this.configService);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("interceptor added api Key: ${configService.apiKey}");
    // options.headers["Authorization"] = token;
    options.queryParameters.addAll({
      "api_key": configService.apiKey,
    });
    super.onRequest(options, handler);
  }
}
