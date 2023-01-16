import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'feed.dart';
import 'package:firebase_database/firebase_database.dart';


class MySignupPage extends StatefulWidget {
  const MySignupPage({super.key, required this.title});

  final String title;

  @override
  State<MySignupPage> createState() => _MySignupState();
}

class _MySignupState extends State<MySignupPage> {
  //int _selectedIndex =9;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("SIGNUP"),

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
              margin: const EdgeInsets.only(left: 35, right: 35 ),
              child:  TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 20,left: 35, right: 35),
              child:  TextField(
                controller: nameController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'name',
                  //fillColor: Colors.white,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 20,left: 35, right: 35),
              child:  TextField(
                controller: phonenumberController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'phone number',
                  //fillColor: Colors.white,
                ),
              ),
            ),

            TextButton(
              style: TextButton.styleFrom(
                shadowColor: Colors.amberAccent,
                foregroundColor: Colors.blue,
              ),
              onPressed: () async {

                //SIGN UP USER TO AUTHETICATION
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: usernameController.text, password: passwordController.text)
                    .then((uid) {
                  print(
                      "successfully signed up the user! UID:" + uid.toString());
                  var userProfile = {
                    'uid' : uid.toString(),
                    'name': nameController.text,
                    'phone': phonenumberController.text,
                    'email': usernameController.text,
                  };


                  var user = FirebaseAuth.instance.currentUser;
                  var Uid = user?.uid;

                  //PASS DATA TO FIREBASE DATABASE
                  FirebaseDatabase.instance.ref().child("usr"+ Uid.toString())
                      .set(userProfile)
                      .then((value) {
                    print ("Successfully created the profile info");
                  })
                      .catchError((error){
                    print(" Failed to create the Profile for user!");
                    print(error.toString());
                  });

                }).catchError((error){
                  print(" Failed to create the user info!");
                  print(error.toString());
                });


              },
              child:const Text('Signup'),

              //sign up a user
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
                child: const Text('Go To Feed'),
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
