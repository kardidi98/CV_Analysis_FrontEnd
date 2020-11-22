
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cv_analyse/API/API.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

String _filename = "";
String filePath="";
Uint8List image ;

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() =>  _MainPageState();

}



class _MainPageState extends State<MainPage> {


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('File Uploaded Successfully'));

  void _openFileExplorer(key) async {
    try {

      var file = await FilePicker.getFile(type: FileType.custom, allowedExtensions: ['pdf'] ) ;
      filePath=file.path;
      if (filePath == '') {
        return;
      }

      setState((){_filename = filePath.split("/").last;});
      key.currentState.showSnackBar(snackBar);
      var result = Base64Decoder().convert(await GetData(file));
      if(result != null){
        setState((){image = result;});
      }

    } on PlatformException catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(

                padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
                child: Column(
                  children : [
                    SizedBox(
                      height: MediaQuery.of(context).size.height/12,
                      width: MediaQuery.of(context).size.width/1.5,
                      child: RaisedButton(
                        onPressed: () =>{

                          _openFileExplorer(scaffoldKey),

                        },

                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.upload_rounded,
                              color: Colors.white,
                            ),
                            Text(" Upload your CV", style: TextStyle(color: Colors.white, fontSize: 18),),

                          ],
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                            new BorderRadius.circular(50.0)
                        ),
                        color: Colors.purple,

                      ),
                    ),
                  Center(

                    child: _filename == ""
                        ? new Text('No file selected.')
                        : new Text(_filename,textAlign: TextAlign.center,),
                  )

                  ]

                )

              ),
            const Divider(
              color: Colors.black,

            ),
            Container(

              padding: const EdgeInsets.only(top: 20.0, bottom: 30.0,left: 30.0,right: 30.0),
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/2.5,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                        color:  Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,

                          ),
                        ],
                    ),
                    child: image == null
                        ? Center(
                          child: Text("Upload your CV to see the result.", style: TextStyle(color: Colors.grey),),
                        )
                        :
                        Center(
                          child: Image.memory(image),
                        ),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}