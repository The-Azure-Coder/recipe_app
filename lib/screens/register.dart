import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_app/screens/login.dart';

import '../services/network_handler.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  String error = '';
  String first_name = '';
  String last_name = '';
  String email_address = '';
  String password = '';

  Future<bool> register(String firstName, String lastName, String emailAddress,
      String password) async {
    //check if login

    Map registerStatus = jsonDecode(await NetworkHandler.post("/users/signup", {
      "first_name": first_name,
      "last_name": last_name,
      "email_address": email_address,
      "password": password,
    }));

    if (registerStatus["status"] == 'success') {
      print("User created");
      print(registerStatus);
      return true;
    }
    setState(() {
      error = 'something went wrong';
    });
    return false;
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.vox-cdn.com/thumbor/5d_RtADj8ncnVqh-afV3mU-XQv0=/0x0:1600x1067/1200x900/filters:focal(672x406:928x662)/cdn.vox-cdn.com/uploads/chorus_image/image/57698831/51951042270_78ea1e8590_h.7.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Form(
                  key: _formkey,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 109, 108, 108)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 0.5,
                        )
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.white.withOpacity(0.6),
                    ),
                    width: 320,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(bottom: 20),
                            width: 180,
                            child: const Text(
                              'Registration',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 106, 105, 105),
                                  fontSize: 25),
                              textAlign: TextAlign.center,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: 120,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 1.5,
                                          offset: const Offset(0, 2))
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please first Name';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        error = "";
                                        first_name = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 15),
                                        border: InputBorder.none,
                                        hintText: 'First Name',
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade400)),
                                  ),
                                )),
                            SizedBox(
                                width: 120,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 1.5,
                                          offset: const Offset(0, 2))
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: Colors.white,
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.name,
                                    onChanged: (value) {
                                      setState(() {
                                        // error = "";
                                        last_name = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 15),
                                        border: InputBorder.none,
                                        hintText: 'Last Name',
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade400)),
                                  ),
                                )),
                          ],
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10)),
                        SizedBox(
                            width: 265,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1.5,
                                      offset: const Offset(0, 2))
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                              child: TextField(
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  setState(() {
                                    // error = "";
                                    email_address = value;
                                  });
                                },
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 15),
                                    border: InputBorder.none,
                                    hintText: 'username',
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400)),
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: 265,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1.5,
                                      offset: const Offset(0, 2))
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                              child: TextField(
                                keyboardType: TextInputType.name,
                                obscureText: true,
                                onChanged: (value) {
                                  setState(() {
                                    // error = "";
                                    password = value;
                                  });
                                },
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 15),
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400)),
                              ),
                            )),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10)),
                        SizedBox(
                            width: 260,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1.5,
                                      offset: const Offset(0, 2))
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                              child: TextField(
                                obscureText: true,
                                onChanged: (value) {
                                  setState(() {
                                    // error = "";
                                    // organization = value;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 15),
                                    border: InputBorder.none,
                                    hintText: 'Verify Password',
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400)),
                              ),
                            )),
                        const SizedBox(height: 20),
                        Container(
                          width: 265,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 175, 14),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: TextButton(
                            onPressed: () async {
                              if (await register(
                                first_name,
                                last_name,
                                email_address,
                                password,
                              )) {
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'REGISTER',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already Have an Account?',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 136, 136, 136)),
                              ),
                              const SizedBox(width: 40),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                                child: const Text(
                                  'login',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 182, 137, 2)),
                                ),
                              )
                            ]),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
