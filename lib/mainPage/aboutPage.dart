import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0,left: 30.0,right: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "   This application is designed to get a general idea of ​​the profile that suits you the most based only on your CV. "
                  "You can also discover the compatibility of your CV with other fields.\n\n"
                  "   All you have to do is upload your CV and instantly see the result.",
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.justify,
            ),
            Image.asset("images/CVs.png")
          ],
        )

      ),
    );
  }
}
