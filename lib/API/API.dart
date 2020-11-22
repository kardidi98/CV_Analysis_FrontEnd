import "package:http/http.dart" as http;
import 'package:http_parser/http_parser.dart';

Future<String> GetData (file) async{
  http.MultipartRequest request =  http.MultipartRequest("POST", Uri.parse("http://192.168.137.1:5000/api/getGraph"));
  request.files.add(
    await http.MultipartFile.fromPath(
      'file',
      file.path,
      contentType: MediaType('application', 'pdf'),
    ),
  );
  request.headers['Content-Type'] = "multipart/form-data";

  var streamedResponse = await request.send();
  print("*******************");
  print(streamedResponse.statusCode);
  var response = await streamedResponse.stream.bytesToString();
  return response;
}