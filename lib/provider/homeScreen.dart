import 'package:fb/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenListener extends StatelessWidget {
  const HomeScreenListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterClassApi>(
      builder: (context, country, child) => Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: country.countryList.length,
            itemBuilder: (context, index) {
              var data = country.countryList[index];
              return ListTile(
                leading: Text(index.toString()),
                title: Text(data.name),
              );
            },
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     counterProvider.increaseValue();
          //   },
          //   child: Icon(Icons.add),
          // ),
          ),
    );
  }
}
