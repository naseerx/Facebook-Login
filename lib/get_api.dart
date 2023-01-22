import 'package:fb/main.dart';
import 'package:flutter/material.dart';

class MaazApi extends StatefulWidget {
  const MaazApi({Key? key}) : super(key: key);

  @override
  State<MaazApi> createState() => _MaazApiState();
}

class _MaazApiState extends State<MaazApi> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final cvvCodeController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyHomePage()));
          }, icon: Icon(Icons.add)),
        ],
      ),
      backgroundColor: const Color(0xFFC745F4),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                width: double.infinity,
                height: 680,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Sponsor Information',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40),
                        child: TextField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                              fillColor:
                              const Color(0xFFC745F4).withOpacity(0.2),
                              filled: true,
                              hintText: 'First Name',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40),
                        child: TextField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                              fillColor:
                              const Color(0xFFC745F4).withOpacity(0.2),
                              filled: true,
                              hintText: 'Last Name',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40),
                        child: TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                              fillColor:
                              const Color(0xFFC745F4).withOpacity(0.2),
                              filled: true,
                              hintText: 'Address',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40),
                        child: TextField(
                          controller: zipCodeController,
                          decoration: InputDecoration(
                              fillColor:
                              const Color(0xFFC745F4).withOpacity(0.2),
                              filled: true,
                              hintText: 'Zip Code',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40),
                        child: TextField(
                          controller: cvvCodeController,
                          decoration: InputDecoration(
                              fillColor:
                              const Color(0xFFC745F4).withOpacity(0.2),
                              filled: true,
                              hintText: 'CVV Code',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40),
                        child: TextField(
                          controller: expiryDateController,
                          decoration: InputDecoration(
                              fillColor:
                              const Color(0xFFC745F4).withOpacity(0.2),
                              filled: true,
                              hintText: 'Expiry Date',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40),
                        child: TextField(
                          controller: cardNumberController,
                          decoration: InputDecoration(
                              fillColor:
                              const Color(0xFFC745F4).withOpacity(0.2),
                              filled: true,
                              hintText: 'Card Number',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      // ConstantButton(
                      //   buttonName: 'Submit',
                      //   buttonColor: const Color(0xFF50C878),
                      //   onPressed: () {},
                      // )

                      ElevatedButton(
                          onPressed: () {}, child: const Text('Submit'))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
