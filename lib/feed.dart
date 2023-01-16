import 'package:flutter/material.dart';
import 'package:musicmapp4/create.dart';
import 'settings.dart';
import 'package:firebase_database/firebase_database.dart';

class MyFeedPage extends StatefulWidget {
  const MyFeedPage({super.key, required this.title});

  final String title;

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {

  //int _selectedIndex = 0;


  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var typeController = TextEditingController();



  static const List<Widget> _widgetOptions = <Widget>[
/*
    MyFeedPage(title: "Home"),
    MyMessagesPage(title: "Messages"),
    MyProfilePage(title: "Profile"),
    MyFollowingPage(title: "Following"),
    MyCreatePage(title : "Create")*/
    /* Text(
      'Index 0: Home',
      //style: optionStyle,
    ),
    Text(
      'Index 1: Messages',
      //style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      //style: optionStyle,
    ),
    Text(
      'Index 2: Following',
      //style: optionStyle,
    ),
    Text(
      'Index 2: Create',
      //style: optionStyle,

    ),*/

  ];

  void _onItemTapped(int index) {
    setState(() {
      //_selectedIndex = index;
      //_pageOptions = index;
    });
  }

  void _incrementCounter() {
    setState(() {

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyCreatePage(title: 'Flutter Demo Home Page')),
      );
    });
  }

  //final List<String> entries = <String>['Tom', 'Susan', 'Carey','Alberto','Timothy','Crushek'];
  //final List<int> colorCodes = <int>[600,600,600];

  var feedList = [];

  var standinfeedList = [ 'https://imgc.allpostersimages.com/img/posters/bob-masse-bob-dylan-and-paul-simon-in-concert_u-L-E8BSQ0.jpg','https://imgc.allpostersimages.com/img/posters/unknown-miles-davis-1957_u-L-F8JWRO0.jpg','https://imgc.allpostersimages.com/img/posters/bob-masse-the-red-hot-chili-peppers-in-concert_u-L-E8BSJ0.jpg','https://imgc.allpostersimages.com/img/posters/david-bowie-as-ziggy-stardust-1972-london-concert_u-L-F9BDTY0.jpg?artHeight=900&artPerspective=n&artWidth=900&background=fbfbfb'];

  //final snapshot = await ref.child('students').get();

  _MyFeedPageState() {
    var feedTMPList =[];

    DatabaseReference ref = FirebaseDatabase.instance.ref();

    ref.child("events")
        .get()
        .then((datasnapshot) async {
      print("Successfully loaded data");
      print(datasnapshot);
      print("KEY:");
      print(datasnapshot.key);
      //k = datasnapshot.key;
      print("VALUE:");
      print(datasnapshot.value);
      //v= datasnapshot.value;



      Map<dynamic, dynamic> result = Map<dynamic, dynamic>.from(datasnapshot.value as Map<dynamic, dynamic>);


      result.forEach((k,v) {
        print (k);
        print (v);
        feedTMPList.add(v);
      });


      feedList = feedTMPList;
      setState(() {
      });

    }).catchError((error){
      print("failed to load data");
    });

  }



  @override
  Widget build(BuildContext context) {
    // _widgetOptions.elementAt(_selectedIndex);

    label:'Feed';
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Show Snackbar',
            onPressed: () {

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MySettingsPage(title: 'Settings'))
              );
            },
          ),

        ],
        title: Image.asset('assets/musicmappicon.png',
          fit: BoxFit.contain,
          height: 100,
        ),
        centerTitle: true,
      ),




      backgroundColor: Colors.greenAccent,


      body: StreamBuilder<Object>(
        stream: FirebaseDatabase.instance.ref().child("image").onValue,
        builder: (BuildContext context, AsyncSnapshot datasnapshot) {
          if (datasnapshot.hasData &&
              datasnapshot.data.snapshot.value is Map &&
              datasnapshot.data.snapshot.value.keys.length > 0) {
            Map data = datasnapshot.data.snapshot.value;
            List<String> feedList = [];
            data.keys.forEach((key) {
              feedList.add(data[key]);
            });
            return ListView.builder(
              itemCount: feedList.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(feedList[index]);
              },
            );
          } else {
            return ListView.builder(
              itemCount: standinfeedList.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(standinfeedList[index]);
              },
            );

          }
        },
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),


    );
    /*  bottomNavigationBar:  BottomNavigationBar(

        onTap: (_selectedIndex) {

          if (_selectedIndex == 0) Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyFeedPage(title: 'Feed')));
          if (_selectedIndex == 1) Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyMessagesPage(title: 'Messages')));
          if (_selectedIndex == 3) Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyProfilePage(title: 'Profile')));
          if (_selectedIndex == 4) Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyFollowingPage(title: 'Following')));
          if (_selectedIndex == 5) Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyCreatePage(title: 'Create')));

        },

        items:  <BottomNavigationBarItem>[



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
         currentIndex: _selectedIndex,

        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black26,
        //onTap: _onItemTapped,
      ),*/

    // This trailing comma makes auto-formatting nicer for build methods.

  }
}
