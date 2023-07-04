import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isloading = true;
  String error = "";
  late String data;

  @override
  void initState() {
    exampGetData();
    // TODO: implement initState
    super.initState();
  }

  exampGetData() async {
    Dio dio = Dio();

    var response = await dio.get("Url");
    isloading = false;

    if (response.statusCode == 200) {
      setState(() {
        data = response.data.toString();
      });
    } else if (response.statusCode == 401) {
      setState(() {
        error = 'token';
      });
    } else if (response.statusCode == 402) {
      setState(() {
        error = 'token';
      });
    }
    //any error
    //...
    else {
      error = response.data['cause'].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Loading(
              isloading: isloading,
              error: error,
              body: Text(
                data,
              ),
            )
          ],
        ),
      ),
    );
  }
}
