import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> callBackend() async {
    Map<String, String> headers = {
      'content-type': 'application/json',
    };

    Map<String, dynamic> body = {
      'title': 'Teste',
      'body': 'Conteudo',
      'userId': 1,
    };

    final dio = Dio();

    try {
      Response response = await dio.post(
        'http://jsonplaceholder.typicode.com/posts',
        options: Options(
          headers: headers,
        ),
        data: body,
      );
      print(response.data);

      // throw 'Erro customizado';
    } on DioError catch (e) {
      print('Erro na request: ${e.response?.statusCode}');

      // print('Error generico: $e');
    }

    // http.Response response = await http.post(
    //   Uri.parse('http://jsonplaceholder.typicode.com/posts'),
    //   headers: headers,
    //   body: json.encode(body),
    // );

    // if (response.statusCode >= 200 && response.statusCode < 300) {
    //   // Usando lib do http
    //   // print(response.body);
    //   // List result = json.decode(response.body);
    //   // for (var item in result) {
    //   //   print(item['title']);
    //   // }

    //   print(response.body);
    // } else {
    //   // Usando lib do http
    //   //print('Aconteceu um erro: ${response.statusCode}');
    // }
  }

  @override
  void initState() {
    super.initState();
    callBackend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste HTTP'),
      ),
      body: const Center(
        child: Text('Realizando teste HTTP'),
      ),
    );
  }
}
