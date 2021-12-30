import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);
  final String url;

  Future getData() async{
    try{
      var request = http.Request('GET', Uri.parse(url));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200){
        String data = await response.stream.bytesToString();
        var decodedData = jsonDecode(data);
        return decodedData;
      }
      else{
        print (response.reasonPhrase);
      }
    }
    catch(e){
      print (e);
    }
  }

}