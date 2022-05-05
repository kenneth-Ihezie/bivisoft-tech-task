import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



String? userName;
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _actionBarButton = Icon(
    Icons.delete,
    color: Colors.blueAccent[400],
  );
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Home Screen"),
            actions: [_actionBarButton],
          ),
          body: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  Text("Welcome " + userName!),
                ],
              )
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add, color: Colors.white),
          ),
        );
  }

  _navigateToNoteScreen(){
    Navigator.of(context).pushNamed('/noteScreen');
  }
}
