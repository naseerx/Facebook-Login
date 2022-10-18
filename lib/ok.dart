import 'package:flutter/material.dart';

class FlutterJamal extends StatefulWidget {
  const FlutterJamal({Key? key}) : super(key: key);

  @override
  State<FlutterJamal> createState() => _FlutterJamalState();
}

class _FlutterJamalState extends State<FlutterJamal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.teal,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Save more money",style: TextStyle(fontSize: 16,color: Colors.white),),
                    SizedBox(height: 12,),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipisicing elit,'
                      ' sed do emus temper incididunt ut labore et dolore'
                      ' magna alia. Ut enim ad minim veniam, quis nostrud '
                      'sunt in cuppa qui official deserunt mollit anim id est laborum.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('This is button')))
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.teal,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Save more money",style: TextStyle(fontSize: 16,color: Colors.white),),
                    SizedBox(height: 12,),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipisicing elit,'
                      ' sed do emus temper incididunt ut labore et dolore'
                      ' magna alia. Ut enim ad minim veniam, quis nostrud '
                      'sunt in cuppa qui official deserunt mollit anim id est laborum.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('This is button')))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
