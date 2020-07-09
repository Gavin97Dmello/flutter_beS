import 'package:http/http.dart' as http;

import 'dart:io';
import 'dart:convert';
import 'dart:async';


class ApiProvider {
  final String _baseUrl = 'test.api.talentunbound.zaya.in';
  
  Map<String, String> _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': "Token f766303b36b7a1a23cb7b972b7333cdd1e160a46"
  };
    
  Future<dynamic> getFeeds( Map<String, String>url) async {
    var responseJson;
    final uri = Uri.http(_baseUrl, '/api/v1/adventures/', url);
      final response = await http.get(uri, 
      headers: _headers );
      responseJson = _response(response);
    return responseJson;

  }

  Future<dynamic> getAdventure( String id) async {
    var responseJson;
    final uri = Uri.http(_baseUrl, '/api/v1/adventures/${id}',);
      final response = await http.get(uri, 
      headers: _headers );
      responseJson = _response(response);
    return responseJson;

  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      default:
        
    }
  }
}