import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  final String baseUrl = "https://biratkoshielectricyatayaat.com/api";
  // Generic GET
  Future<Map<String, dynamic>> get(String endpoint, {Map<String, String>? headers}) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(uri, headers: headers);

    return _processResponse(response);
  }

  // Generic POST
  Future<Map<String, dynamic>> post(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json', ...?headers},
      body: body != null ? jsonEncode(body) : null,
    );

    return _processResponse(response);
  }

  // Generic PUT
  Future<Map<String, dynamic>> put(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.put(
      uri,
      headers: {'Content-Type': 'application/json', ...?headers},
      body: body != null ? jsonEncode(body) : null,
    );

    return _processResponse(response);
  }

  // Generic DELETE
  Future<Map<String, dynamic>> delete(String endpoint, {Map<String, String>? headers}) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.delete(uri, headers: headers);

    return _processResponse(response);
  }

  // Private helper to handle response
  Map<String, dynamic> _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body.isEmpty ? '{}' : response.body;
    final data = jsonDecode(body);

    if (statusCode >= 200 && statusCode < 300) {
      return data;
    } else {
      // Extract message field if exists
      final msg = data['message'] ?? 'Unknown error';
      throw ApiException(msg, statusCode);
    }
  }
}
class ApiException implements Exception {
  final String message;
  final int code;

  ApiException(this.message, this.code);

  @override
  String toString() => 'API Error $code: $message';
}
