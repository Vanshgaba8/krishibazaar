import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:krishibazaar/data/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final headers = <String, String>{
        'Content-Type': 'application/json',
      };

      Response response = await post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(data),
      ).timeout(Duration(seconds: 20));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future<dynamic> getWithBearerToken(String url, String token) async {
    dynamic responseJson;
    try {
      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await http
          .get(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(Duration(seconds: 20));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
      case 500:
        throw FetchDataException(
            "Error occurred with status code ${response.statusCode}");
      default:
        throw FetchDataException(
            "Unexpected error with status code ${response.statusCode}");
    }
  }

  @override
  Future<dynamic> postWithBearerToken(
      String url, dynamic data, String token) async {
    dynamic responseJson;
    try {
      if (data is Map<String, dynamic> && data.containsKey('file')) {
        // Handling file upload
        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.headers['Authorization'] = 'Bearer $token';

        // Add form fields
        data.forEach((key, value) {
          if (key != 'file') {
            request.fields[key] = value.toString();
          }
        });

        // Add file if it exists
        if (data['file'] != null) {
          request.files.add(
              await http.MultipartFile.fromPath('file', data['file'].path));
        }

        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        responseJson = returnResponse(response);
      } else {
        // Regular POST request (JSON payload)
        final headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        final response = await http
            .post(
              Uri.parse(url),
              headers: headers,
              body: json.encode(data),
            )
            .timeout(Duration(seconds: 20));
        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }
}
