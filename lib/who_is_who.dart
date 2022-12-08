import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:fb/get_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WhoIsWho extends StatefulWidget {
  const WhoIsWho({Key? key}) : super(key: key);

  @override
  State<WhoIsWho> createState() => _WhoIsWhoState();
}

class _WhoIsWhoState extends State<WhoIsWho> {
  late StreamController streamController;
  late Stream stream;
  String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.e'
      'yJhdWQiOiIxIiwianRpIjoiYzIyYTY3M2Y2YzU2ZDJjNDVhNmJhM'
      'WNjM2M3MzE5ZDA1ZGRlNzIxZTU2ZWNkNjg3MDQyOWI5MWNjMDk1Y2U'
      '2N2U2NjAwZGY1ZDQ0NzJjOTUiLCJpYXQiOjE2NzAwNTM5MzQuODY3N'
      'jQzLCJuYmYiOjE2NzAwNTM5MzQuODY3NjQ1LCJleHAiOjE3MDE1ODk'
      '5MzQuODY1NzI0LCJzdWIiOiI3Iiwic2NvcGVzIjpbXX0.UjZsAKGZ5J'
      'kJ8UN809BBtkFDrQzryj2MjRt3Eq8A7NEJOwbzjESYmNo4EE7R99kzWk'
      '8insSOR4QVZN8H3LMaJfBVDpPAeu6MJ-V5WIODOMARzMBUjT9CVgVowG_'
      'VyBijNTds6mUW8PijqD79vevGplT6dBlWhWln4MnJ2cp7EZA-sHdCrX9s'
      '_rCWDCWou5p_OQXOHtQtC5Bkmv_9O-xL2lr1n3sXeZhBIHDkFbh0NQsRYr'
      'UIE2-tmuJrxHac-cvGdKqvi8YsqZYXu-c0vrDUyIIckMimU_mxo1x5_d'
      '510NaKvwEi5CdsEfyhY4NpGzqf_cvHPUOi1UDj90r_y_NmRtuQ1zDCkko'
      'VBySNELa6X1KHLS0In2bPSfQioFMJdRILp1xOyk-hbdTg7JplHnmX5Yh'
      'VEABXJ5kUtJCSV1hM7mgAoK1flXUjfYfqAJ8Xi4HlK2uX29_5Mw_Qh4W'
      'b96FgAZV51Hv37YjJZ6hdoccC0rIlJRHjKr-5lrimGDZQdUlU7th8Lqd'
      'o0Zcj3ZatYmyZTs7cPR_HnhYYCLa4DSkyeRcFYoRkXT_0hKd6SoHKTx'
      '59QJDxiO9rwKbAlCT71z_ZWFvJUzaqdlQtQuGvVs3202hB6g-u3fc0jgh'
      'ohhEaIfyUzDvi9XngTkD_MkFcqswUzrND_j8rLCgkBgsCdNER8xc';

  bool loading = true;

  getAllEmployee() async {
    streamController.add('loading');
    var api = "https://hqsupplys.com/public/api/employee";
    var response = await http.get(Uri.parse(api), headers: {
      'Accept': "application/json",
      'Content-Type': "application/json",
      'Authorization': "Bearer $token",
    });
    print(response.statusCode);
    print("Body: ${response.body}");

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      GetWandersModel model = GetWandersModel.fromJson(jsonData);
      print(model);
      streamController.add(model);
    } else {
      print(response.statusCode);
    }
    log("Api Okay... ");
    setState(() {
      loading = false;
    });
  }

  @override
  initState() {
    super.initState();
    streamController = StreamController();
    stream = streamController.stream;
    getAllEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Whi is Who',
              style: TextStyle(
                  color: Color(0xFF243690),
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Flexible(
                    child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: 'Seach',
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                )),
                const SizedBox(
                  width: 20,
                ),
                const Icon(Icons.send),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                'All Employees (5002)',
                style: TextStyle(
                    color: Color(0xFF243690),
                    fontWeight: FontWeight.w600,
                    fontSize: 14.5),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder(
                stream: stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == 'loading') {
                      return const SizedBox(
                        height: 350,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      GetWandersModel postModal =
                          snapshot.data as GetWandersModel;
                      return postModal.success.isNotEmpty
                          ? GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: postModal.success.length,
                              itemBuilder: (context, index) {
                                var data = postModal.success[index];
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Text(data.firstName),
                                      Text(data.lastName),
                                    ],
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Container(
                                height: 350,
                                alignment: Alignment.center,
                                child: const Text(
                                  'No one has posted yet.',
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                    }
                  } else {
                    return const Text('no data');
                  }
                }),

          ],
        ),
      ),
    );
  }
}
