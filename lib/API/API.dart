import "package:http/http.dart" as http;
import 'package:http_parser/http_parser.dart';

Future GetData ( file) async{
  http.MultipartRequest request =  http.MultipartRequest("POST", Uri.parse("http://192.168.0.112/api/getGraph"));
  //request.files.add(await http.MultipartFile.fromPath('file', file.path)) ;

  request.files.add(
    await http.MultipartFile.fromPath(
      'images',
      file.path,
      contentType: MediaType('application', 'pdf'),
    ),
  );
  request.headers['Content-Type'] = "multipart/form-data";

  http.StreamedResponse response = await request.send();
  print("*******************");
  print(response.statusCode);
  return response;
}