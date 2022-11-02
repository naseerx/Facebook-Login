import 'package:flutter/material.dart';

class FbDetails extends StatefulWidget {
  final String name;
  final String email;
  final String photo;

  const FbDetails({
    Key? key,
    required this.email,
    required this.name,
    required this.photo,
  }) : super(key: key);

  @override
  State<FbDetails> createState() => _FbDetailsState();
}

class _FbDetailsState extends State<FbDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( widget.name),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    widget.photo,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'NAME: ' + widget.name,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20,),
            Text('EMAIL: ' + widget.email,
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
