import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GetApiScreen extends StatefulWidget {
  const GetApiScreen({Key? key}) : super(key: key);

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API'),
      ),
    );
  }
}
