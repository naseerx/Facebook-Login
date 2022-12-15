import 'package:fb/get_model.dart';
import 'package:fb/model/dic_api.dart';
import 'package:fb/provider/api_who_provider.dart';
import 'package:fb/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhoApiHomeScreen extends StatelessWidget {
  const WhoApiHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DictionaryApiProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: const Text('API'),
        ),
        body: StreamBuilder(
          stream: provider.stream,
          builder: (context, snapshot) {
            HelloModal model = snapshot.data as HelloModal;

            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(model.word),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
