import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:musicmapp4/create.dart';
import 'settings.dart';
import 'feed.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'dart:io';


class MyCreatePage extends StatefulWidget {
  const MyCreatePage({super.key, required this.title});

  final String title;

  @override
  State<MyCreatePage> createState() => _MyCreatePageState();
}




class _MyCreatePageState extends State<MyCreatePage> {

  XFile? singleImage;

  //int currentIndex = 4;

  var imageController = TextEditingController();
  var nameController = TextEditingController();
  var dateController = TextEditingController();
  var placeController = TextEditingController();
  var infoController = TextEditingController();
  String dataUrl = 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==';



  @override
  Widget build(BuildContext context) {
    label:'Following';
    return Scaffold(
      appBar: AppBar(

        title: Image.asset('assets/musicmappicon.png',
          fit: BoxFit.contain,
          height: 100,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.greenAccent,
      body: SingleChildScrollView(

        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            singleImage != null && singleImage!.path.isNotEmpty
                ? Image.file(File(singleImage!.path))
                :const SizedBox.shrink(),

            MaterialButton(
              onPressed: () async{
                singleImage =await singleImagePick();
                if (singleImage != null && singleImage!.path != null) {
                  setState((){});
                  uploadImage(singleImage!);
                  print(await uploadImage(singleImage!));
                }
              },
              color: Colors.pinkAccent,
              textColor: Colors.white,
              child: const Text (" Pick Show Poster"),

            ),
            /*TextField(
              controller: imageController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'image',
                //fillColor: Colors.white,
              ),

            ),

            TextField(
              controller: nameController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'name',
                //fillColor: Colors.white,
              ),

            ),

            TextField(
              controller: dateController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'date',
                //fillColor: Colors.white,
              ),
            ),


            TextField(
              controller: placeController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'place',
                //fillColor: Colors.white,
              ),
            ),*/

            /*const Text(
                'LOGO PLACE HOLDER'
            ),
            const Text(
                'CREATE PAGE'
            ),*/
            Container(
              width:220,
              margin: const EdgeInsets.only(left: 10, right: 10 , bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[800], // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: () {
                  print (imageController.text);
                  print (nameController.text);
                  print (dateController.text);
                  print (placeController.text);

                  /*  var timestamp = new DateTime.now().millisecondsSinceEpoch;
                  FirebaseDatabase.instance.ref().child("events/stu" + timestamp.toString()).set(
                      {
                        "https":'//imgc.allpostersimages.com/img/posters/unknown-miles-davis-1957_u-L-F8JWRO0.jpg',
                        "name": nameController.text,
                        "date": dateController.text,
                        "place": placeController.text
                      }
                  ).then((value){
                   // print("successfully added friend");
                  }).catchError((error){
                   // print("FAILED added friend");
                  });*/
                },

                child: const Text('Post Show Poster'),
              ),
            ),

          ],
        ),

      ),

/*      bottomNavigationBar: BottomNavigationBar(


        onTap: (_selectedIndex) {

          if (_selectedIndex == 0) Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyFeedPage(title: 'Feed')));
          if (_selectedIndex == 1) Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyMessagesPage(title: 'Messages')));
          if (_selectedIndex == 3) Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyProfilePage(title: 'Profile')));
          if (_selectedIndex == 4) Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyFollowingPage(title: 'Following')));
          if (_selectedIndex == 5) Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyCreatePage(title: 'Create')));

        },
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Messages',
            tooltip: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            label: 'Profile',
            tooltip: 'Profile',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.double_arrow_outlined),
            label:'Following',
            tooltip: 'See who you Follow',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label:'Create',
            tooltip: 'Create New Event',
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black26,

      ),*/

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future <XFile?> singleImagePick() async{
  return await ImagePicker().pickImage(source: ImageSource.gallery);
}

Future <String> uploadImage (XFile image) async{
  print (getImageName(image));

  var timestamp = new DateTime.now().millisecondsSinceEpoch;
  Reference db =FirebaseStorage.instance.ref("events/${getImageName(image)}" + timestamp.toString());
  await db.putFile(File(image.path));
  return await db.getDownloadURL();
}

String getImageName(XFile image) {

  return image.path.split("/").last;
}