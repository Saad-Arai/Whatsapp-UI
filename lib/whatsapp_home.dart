import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/call_screen.dart';
import 'package:flutter_whatsapp/camera_screen.dart';
import 'package:flutter_whatsapp/chat_screen.dart';
import 'package:flutter_whatsapp/status_screen.dart';

class WhatsAppHome extends StatefulWidget
{
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin
{
  TabController _tabController;

  @override
  void initState()
  {
    super.initState();
    _tabController = new TabController(vsync: this,initialIndex: 1,length: 4);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Whatsapp"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: "CHATS"),
            new Tab(text: "STATUS",),
            new Tab(text: "CALLS",),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new Icon(Icons.more_vert)
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
        new CameraScreen(),
          new ChatScreen(),
          new StatusScreen(),
          new CallScreen(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(Icons.message,color: Colors.white,),
        onPressed: ()=> print("open chats"),
      ),
    );
  }
}