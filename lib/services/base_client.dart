import 'package:http/http.dart' as http;

String baseUrl = 'http://examination.24x7retail.com';

class BaseCient{
  var client = http.Client();
  var _headers = {
    'api_key' : "?D(G+KbPeSgVkYp3s6v9y\$B&E)H@McQf",
  };
  Future<dynamic> get(String api) async{
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(url, headers: _headers);
    if(response.statusCode == 200){
      return response.body;
    }
  }

  Future<dynamic> post(String api) async{}

  Future<dynamic> put(String api) async{}

  Future<dynamic> delete(String api) async{}
}