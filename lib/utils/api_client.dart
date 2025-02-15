import 'package:dio/dio.dart';

abstract class ApiClient{
  ApiClient({
    String? host,
    int? port,
    Dio Function()? clientFactory,
  }) : host = host ?? 'localhost',
        port = port ?? 8080,
        clientFactory = clientFactory ?? (() => Dio());

  final String host;
  final int port;
  final Dio Function() clientFactory;


  String get baseUrl => 'http://$host:$port';
}