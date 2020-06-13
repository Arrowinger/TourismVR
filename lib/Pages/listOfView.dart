import 'package:flutter/material.dart';

class ListOfview extends StatefulWidget {
  @override
  _ListOfviewState createState() => _ListOfviewState();
}
class _ListOfviewState extends State<ListOfview> {
     @override
  Widget build(BuildContext context) {
    return Scaffold(
             backgroundColor: Colors.grey[100],
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    
                  ),
                
                  
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      SizedBox(height: 20,),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                          makeItem(image: 'assets/images/Andaman.jpg', title: 'Andaman'),
                        ],
                        ),
                        ),
                      SizedBox(height: 20,),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                          makeItem(image: 'assets/images/Andaman-and-Nicobar-Islands-6.jpg' , title: 'Nicobar'),
                        ],
                        ),
                        ),
        
                         SizedBox(height: 20,),
                         Container(
                          height: 200,
                          child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                          makeItem(image: 'assets/images/best-places-to-visit-andaman-nicobar-islands.png', title: 'andaman'),
                        ],
                        ),
                        ),
                        SizedBox(height: 20,),
                         Container(
                          height: 200,
                          child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                          makeItem(image: 'assets/images/best-places-to-visit-andaman-nicobar-islands.png', title: 'andaman'),
                        ],
                        ),
                        ),
                        SizedBox(height: 40,),
                    ],
                    ),
                  )
                ],
              ),
            ),
          );
    }
    Widget makeItem({image, title}) {
      return AspectRatio(
        aspectRatio: 1.6 / 1,
        child: Container(

          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            )
          ),
          child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2),
                ]
              )
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
          ),
        ),
      );
    }
    }