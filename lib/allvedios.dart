import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nathra_ama/vedio_sreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//import 'package:nathra_ama/key.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:nathra_ama/data.dart';
//import 'list.dart';
import 'database.dart' as fbDatabase;

import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';

class Allvedios  extends StatefulWidget {
  Allvedios();
  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  @override
  _Allvedios  createState() => _Allvedios ();

}


class _Allvedios extends State<Allvedios >  {
  _Allvedios();
  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  //Video video = new Video();

  //static String myVideoId = 'AlOWMrTcPYg';

  //static String myVideoTitle = video.title;
  // the full url: https://www.youtube.com/watch?v=PQSagzssvUQ&ab_channel=NASA
  // it's an interesting video from NASA on Youtube
  //Data data = new Data();
  //String _username;
  /*Future<String> _loadDataAsset() async {
    return await rootBundle.loadString('assets/data.json');
  }


  Future loadData() async {
    setState(() {
      _loading = true;
    });
    String jsonPage = await _loadDataAsset();
    final jsonResponse = json.decode(jsonPage);
    setState(() {
      data = new Data.fromJson(jsonResponse);
    });
    print(data.vedios[1].vedio_id);
    setState(() {
      _loading = false;
    });
  }*/
  bool _loading = false;

  _launchURL(url) async {
    setState(() {
      _loading = true;
    });
    //const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
    setState(() {
      _loading = false;
    });
  }


  /*Future<void> _loadVedios() async {
    //List vediosList = new List();
    setState(() {
      _loading = true;
    });
    //for(int i; i<2; i++) {
      //String num = (i+1) as String;
      await fbDatabase.findVedios();
    //}
    setState(() {
      _loading = false;
    });
    //return vediosList;
  }*/

  /*Future<void> _loadVedioLinks(String i) async {
    //List vediosList = new List();
    setState(() {
      _loading = true;
    });
    //for(int i; i<2; i++) {
      //String num = (i+1) as String;
      await fbDatabase.findVediosLinks(i);
    //}
    setState(() {
      _loading = false;
    });
    //return vediosList;
  }*/
  /* String url = 'C:/Users/95200/Downloads/CVmaryan.pdf';
  String pdfasset = "assets/CVmaryan.pdf";
  PDFDocument _doc;
  bool _loading;

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(pdfasset);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }
*/
  //String idvedio;
  /*void FetchVedioID(){
    String id;
    loadData();
    setState(() {
    for(int i=0; i< 3; i++ ){
      id= data.vedios[i].vedio_id;

      idvedio = id;

      //return idvedio;
      //return id;
    }
    });
  }*/
  // Initiate the Youtube player controller
  // YoutubePlayerController _controller;


  /* String url = 'C:/Users/95200/Downloads/CVmaryan.pdf';
  String pdfasset = "assets/CVmaryan.pdf";
  PDFDocument _doc;
  bool _loading;

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(pdfasset);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }
*/
  /*void fetchvedio () async{
   String jsonPage = await _loadDataAsset();
   final jsonResponse = json.decode(jsonPage);
   data = new Data.fromJson(jsonResponse);
   print(data.vedios[1].vedio_id);
   //FetchVedioID();
   setState(() {
     for(int i=0; i< data.vedios.length; i++ ){
       _controller = YoutubePlayerController(


         initialVideoId: data.vedios[i].vedio_id,

         flags: YoutubePlayerFlags(
           autoPlay: false,
           mute: false,
         ),

       );
     }

   });
 }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نظرة عامة على الكتاب المقدس', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5), textAlign: TextAlign.right),
      ),

      body: _loading?Center(child: CircularProgressIndicator(),):
      Scrollbar(
        isAlwaysShown: true,
        child:new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new ListView.builder(
                  itemCount: fbDatabase.allVedios.length,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      new Card(
                        child: new Container(
                          child: new Center(
                            child: new Column(
                              // Stretch the cards in horizontal axis
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: ( ) => Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: ( _ ) =>
                                        VideoScreen(id: fbDatabase.allVedios[index].vedio_id, desc: fbDatabase.allVedios[index ].vedio_description, title: fbDatabase.allVedios[index].vedio_title, vedioSerial: fbDatabase.allVedios[index].serial, vedioCat: fbDatabase.allVedios[index].vedio_category,),
                                  ),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                    padding: EdgeInsets.all(5.0),
                                    height: 200.0,
                                    width: 600.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 1),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image(
                                            width: 140.0,
                                            image: NetworkImage('https://img.youtube.com/vi/${fbDatabase.allVedios[index].vedio_id}/0.jpg')
                                          ),
                                        SizedBox(width: 10.0),
                                        Expanded(
                                          child: new Text(
                                            // Read the name field value and set it in the Text widget
                                            fbDatabase.allVedios[index].vedio_title,
                                              // set some style to text
                                              style: new TextStyle(fontSize: 17, color: Colors.blue[900],fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.center
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //padding: const EdgeInsets.all(15.0),
                          margin: EdgeInsets.all(10.0),
                        ),
                      );
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState()  {
    super.initState();
    //loadData();
    // fetchvedio();
    // _initPdf();
    //loadData();
    /*for (int index = 0; index < 2; index++) {
      int x = index+1;
      String n = x.toString();
     _loadVedios(n);
     _loadVedioLinks(n);
    }*/
  }


/*
  Widget pdf() {
    return Scaffold(
        appBar: AppBar(

    ),
    body:_loading ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _doc,
      indicatorBackground: Colors.red,
      // showIndicator: false,
      // showPicker: false,
    ),

    );}
*/
/*Widget video(){
  return Scaffold(
    appBar: AppBar(

    ),
    body:YoutubePlayer(
    controller: _controller,
    liveUIColor: Colors.amber,
  //bottomActions: [
  //CurrentPosition(),
  //ProgressBar(isExpanded: true),
  //],
  showVideoProgressIndicator: true,
  progressColors:ProgressBarColors(
  playedColor: Colors.amber,
  handleColor: Colors.amberAccent,
  ),
  ),);
}*/
}
