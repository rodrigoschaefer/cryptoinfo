import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import '../../injection.dart';
export 'package:http/http.dart';

Future<Response> head(Uri url, {Map<String, String>? headers}) =>
    _withClient((client) => client!.head(url, headers: headers));

Future<Response> get(Uri url, {Map<String, String>? headers}) =>
    _withClient((client) => client!.get(url, headers: headers));

Future<Response> post(Uri url,
        {Map<String, String>? headers, body, Encoding? encoding}) =>
    _withClient((client) =>
        client!.post(url, headers: headers, body: body, encoding: encoding));

Future<Response> put(Uri url,
        {Map<String, String>? headers, body, Encoding? encoding}) =>
    _withClient((client) =>
        client!.put(url, headers: headers, body: body, encoding: encoding));

Future<Response> patch(Uri url,
        {Map<String, String>? headers, body, Encoding? encoding}) =>
    _withClient((client) =>
        client!.patch(url, headers: headers, body: body, encoding: encoding));

Future<Response> delete(Uri url, {Map<String, String>? headers}) =>
    _withClient((client) => client!.delete(url, headers: headers));

Future<String> read(url, {Map<String, String>? headers}) =>
    _withClient((client) => client!.read(url, headers: headers));

Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) =>
    _withClient((client) => client!.readBytes(url, headers: headers));

Future<T> _withClient<T>(Future<T> Function(Client? client) fn) async {
  Client? client = getIt<Client>();
  try {
    return await fn(client);
  } finally {
    client.close();
  }
}
