import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    var data;
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        data = response.body;
        return data;
      } else {
        data = null;
        return data;
      }
    } catch (e) {
      return data = null;
    }
  }
}
