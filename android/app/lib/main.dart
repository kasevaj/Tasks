import 'package:flutter/material.dart';
import 'models/global.dart';
import 'UI/Intray/Intray_page.dart';
import 'package:flutter/services.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        title: "Diary",
        theme: ThemeData(
          primarySwatch: Colors.grey,
        )
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required ThemeData theme});

  final String title;

  @override

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
  super.initState();
  // Hide the status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0, // Removes the shadow line under the AppBar
          backgroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.add_comment_rounded)),
              Tab(icon: Icon(Icons.calendar_month)),
            ],
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(4.0),
            indicatorColor: Colors.transparent, // No visible indicator
          ),
        ),
        body: Stack(
          children: <Widget>[
            TabBarView(
              children: [
                IntrayPage(),
                Container(color: const Color.fromARGB(255, 15, 28, 38)),
                Container(color: const Color.fromARGB(255, 137, 128, 236)),
              ],
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.only(left: 50),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Intray", style: tekstiTyyli1),
                    Container(),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80, left: 170),
              child: ElevatedButton(
                child: Icon(Icons.add, color: greenColor),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
