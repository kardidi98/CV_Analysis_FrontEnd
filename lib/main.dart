import 'package:cv_analyse/mainPage/aboutPage.dart';
import 'package:cv_analyse/mainPage/mainPage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Analysis',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home:DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(child: Text("Home", style: TextStyle(fontSize: 18),),),
                Tab(child: Text("About",style: TextStyle(fontSize: 18)),),
              ],
            ),
            title: Text('CV Analysis'),
          ),
          body: TabBarView(
            children: [

              MyHomePage(title: 'CV Analysis'),

              AboutPage(),
            ],
          ),
        ),
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: MainPage(),
      ),
    );
  }
}



