import 'package:fcm_notification/views/home/home_screen.dart';
import 'package:fcm_notification/views/auth/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),

        height: double.infinity,
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 40),
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {


                   FirebaseAuth.instance
                      .signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text,)
                      .then((value) {
                    Get.to(HomeScreen());
                  });

                },
                child: Text('Sign in'),
              ),

              MaterialButton(
                onPressed: ()  {
                  Get.to(() =>  SignUp(),);
                },
                child:const Text('Do not have account'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
