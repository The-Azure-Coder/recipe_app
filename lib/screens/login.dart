import 'package:flutter/material.dart';
import 'package:recipe_app/screens/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  height: 100,
                ),
                Container(
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
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 180,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 106, 105, 105),
                                fontSize: 25),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                          width: 230,
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
                                  // email_address = value;
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
                          width: 230,
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
                                  // phone_number = value;
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
                      const SizedBox(height: 20),
                      Container(
                        width: 230,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 175, 14),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: TextButton(
                          onPressed: () async {
                            // if (await register(
                            //     first_name,
                            //     last_name,
                            //     email_address,
                            //     phone_number,
                            //     department,
                            //     organization)) {
                            //   Navigator.pop(context);
                            // }
                          },
                          child: const Text(
                            'LOGIN',
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
                              'Don not have an Account?',
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
                                            const registerPage()));
                              },
                              child: const Text(
                                'Register',
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
              ],
            ),
          )),
    );
  }
}
