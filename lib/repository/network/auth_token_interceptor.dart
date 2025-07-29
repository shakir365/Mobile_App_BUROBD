
import 'package:dio/dio.dart';


class AuthTokenInterceptor extends Interceptor {
  static const skipHeader = 'skipAuthToken';

  Dio api;

  AuthTokenInterceptor(this.api);

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    /*final context = MyApp.materialKey.currentContext;

    if (context == null) {
      return;
    }

    final repository = context.read<AuthRepository>();

    final accessToken = await repository.getAccessToken();

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return super.onRequest(options, handler);*/
    print('On Request called');
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    /*final context = MyApp.materialKey.currentContext;

    if (context == null) {
      return;
    }

    final response = err.response?.data;

    if (response == null) {
      return super.onError(err, handler);
    }

    final repository = context.read<AuthRepository>();
*/
    print('On Error called ');
    if (err.response?.statusCode == 401) {
      print('On Error called 401');
    }

    print('On Error called ');

    //return super.onError(err, handler);
    print('On Error called ');
  }

  /*_handlerRefreshToken(
    BuildContext context,
    AuthRepository repository,
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    final requestOptions = err.requestOptions;

    if (requestOptions.headers.containsKey(skipHeader)) {
      return super.onError(err, handler);
    }

    final refreshToken = await repository.getRefreshToken();

    try {
      final response = await api.post(
        '/auth/refresh-token',
        data: {
          'refreshToken': refreshToken,
        },
        options: Options(
          headers: {
            skipHeader: true,
          },
        ),
      );

      final tokens = Tokens.fromJson(response.data);

      await repository.setTokens(tokens);

      try {
        final headers = requestOptions.headers;

        headers[skipHeader] = true;

        final finalResponse = await api.request(
          requestOptions.path,
          cancelToken: requestOptions.cancelToken,
          data: requestOptions.data,
          onReceiveProgress: requestOptions.onReceiveProgress,
          onSendProgress: requestOptions.onSendProgress,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: headers,
          ),
        );

        return handler.resolve(finalResponse);
      } on DioError catch (e) {
        return handler.next(e);
      } catch (e) {
        return super.onError(err, handler);
      }
    } catch (e) {
      context.read<AuthCubit>().logout();
    }
  }*/
}
