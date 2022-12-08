import 'package:fb/get_model.dart';
import 'package:fb/provider/api_who_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhoApiHomeScreen extends StatelessWidget {
  const WhoApiHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WhoApiProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Who is Who'),
        ),
        body: StreamBuilder(
          stream: provider.stream,
          builder: (context, snapshot) {
            GetWandersModel model = snapshot.data as GetWandersModel;

            return ListView.builder(
              itemCount: model.success.length,
              itemBuilder: (context , index){
                var data = model.success[index];
                return ListTile(
                  title: Text(data.firstName),
                  subtitle: Text(provider.countryList.length.toString()),
                  trailing: Text(provider.incrementValue.toString()),
                );
              },
            );

          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            provider.increaseValue();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
