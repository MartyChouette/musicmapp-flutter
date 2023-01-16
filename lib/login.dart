import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musicmapp4/signup.dart';
import 'feed.dart';


class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  //int _selectedIndex = 0;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("Login"),

      ),
      backgroundColor: Colors.greenAccent,
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width:200,
              height:200 ,
              child: Image(
                  image: AssetImage('assets/musicmappicon.png')
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 20,left: 35, right: 35, bottom: 10),
              child:  TextField(
                controller: usernameController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  //fillColor: Colors.white,
                ),
              ),
            ),


            Container(
              margin: const EdgeInsets.only(left: 35, right: 35 , bottom: 10),
              child:  TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),

              onPressed: () {
                print(usernameController.text);
                print(passwordController.text);

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MySignupPage(title: 'Signup'))
                );
              },
              /*      onPressed: () async {
                //Future<UserCredential> ucFuture =

                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: usernameController.text, password: passwordController.text)
                    .then((value) {
                  print("successfully signed up the user!");})
                    .catchError((error){
                  print(" Failed to sign up the user!");
                  print(error.toString());
                });


              },*/

              child:const Text('Signup'),

              //sign up a user
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              onPressed: () { },
              child:const Text('Forgot Password?'),
            ),

            Container(
              width:220,
              margin: const EdgeInsets.only(left: 10, right: 10 , bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[800], // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: () {
                  print(usernameController.text);
                  print(passwordController.text);

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyFeedPage(title: 'Feed'))
                  );
                },
                child: const Text('Sign In'),
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(Icons.star),
                  ),
                  IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(Icons.star),
                  ),
                  IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(Icons.star),
                  ),
                ],

              ),
            ),

          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
