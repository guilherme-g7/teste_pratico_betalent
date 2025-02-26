import 'package:dio/dio.dart';

abstract class ApiClient{
  ApiClient({
    String? host,
    int? port,
    Dio Function()? clientFactory,
  }) : host = host ?? 'localhost',
        port = port ?? 3000,
        clientFactory = clientFactory ?? (() => Dio());

  final String host;
  final int port;
  late final Dio Function() clientFactory;


  String get baseUrl => 'http://$host:$port';
}