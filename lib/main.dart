


//import 'package:andaman_nicbar_island/Animation/FadeAnimation.dart';


import 'package:andaman_nicbar_island/Pages/details.dart';
import 'package:andaman_nicbar_island/Pages/searchBar.dart';
//import 'package:andaman_nicbar_island/searchservice.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import 'package:flutter/material.dart';

void main() { 
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
     home:HomePage()));
   //Materialapp
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark, // status bar color
  ));
}

class HomePage extends StatefulWidget {
  @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
   
     @override
    Widget build(BuildContext context) {
          return   Scaffold(
             backgroundColor: Colors.grey[100],
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/maxresdefault.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.2),
                          ]
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                        //search bar  
                            Text('TOURISM VR',
                              
                              textAlign: TextAlign.center ,style: TextStyle(color: Colors.white, fontSize: 30 , fontWeight: FontWeight.bold),),
                        //end

                            SizedBox(height: 30,),
                            
                            
                            Container(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: TextField(
                              onTap: (){
                               // return Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchBar() ));
                               showSearch(context: context,delegate: DataSearch());
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                                hintText: "search for cities,places ...."
                              ),
                            ),
                          ),
                          SizedBox(height: 30,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1.6 / 1 ,
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue.withOpacity(.2),
                            ),
                            child: Icon(Icons.hotel ,color: Colors.blue,),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 1.6 / 1 ,
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green.withOpacity(.2),
                            ),
                            child: Icon(Icons.satellite, color: Colors.green,),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 1.6 / 1 ,
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red.withOpacity(.2),
                            ),
                            child: Icon(Icons.beach_access,color: Colors.red,),
                          ),
                        ),
                      ],
                    ),
                  ),
                
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text("Best Destination" , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800],fontSize: 20 ),),
                      SizedBox(height: 20,),
                      Container(
                        height: 200,
                        // child: ListView(
                        //   scrollDirection: Axis.horizontal,
                        //   children: <Widget>[
                        //   makeItem(image: 'assets/images/Andaman.jpg', title: 'Andaman'),
                        //   makeItem(image: 'assets/images/Andaman-and-Nicobar-Islands-6.jpg' , title: 'Nicobar'),
                        //   makeItem(image: 'assets/images/best-places-to-visit-andaman-nicobar-islands.png', title: 'andaman'),
                        //   makeItem(image: 'assets/images/best-places-to-visit-andaman-nicobar-islands.png', title: 'nicobar'),
                        // ],
                        // ),

//--------------------------------firebase management  ----------!!!!!!!!!!-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                        child: StreamBuilder(
                          stream: Firestore.instance.collection('bestdestination').snapshots(),
                          builder: (context,snapshot){
                            if (!snapshot.hasData)
                              return CircularProgressIndicator();
                            else 
                              return _buildList(snapshot.data.documents);
                          },
                        ),
                   ),
                      SizedBox(height: 20,),
                      Text("Tourist Places" , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800],fontSize: 20 ),),
                      SizedBox(height: 20,),
                      Container(
                        height: 200,
                        // child: ListView(
                        //   scrollDirection: Axis.horizontal,
                        //   children: <Widget>[
                        //   InkWell(
                        //     child: makeItem(image: 'assets/images/Andaman.jpg', title: 'Andaman'),
                        //     onTap: (){
                        //       return Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(listdata: null,)));
                        //     },
                        //     ),
                        //   makeItem(image: 'assets/images/Andaman-and-Nicobar-Islands-6.jpg' , title: 'Nicobar'),
                        //   makeItem(image: 'assets/images/best-places-to-visit-andaman-nicobar-islands.png', title: 'andaman'),
                        //   makeItem(image: 'assets/images/best-places-to-visit-andaman-nicobar-islands.png', title: 'nicobar'),
                        // ],
                        // ),
                        child: StreamBuilder(
                          stream: Firestore.instance.collection('touristplaces').snapshots(),
                          builder: (context,snapshot){
                            if (!snapshot.hasData)
                              return CircularProgressIndicator();
                            else 
                              return _buildList(snapshot.data.documents);
                          },
                        ),
                        ),
                        
                        SizedBox(height: 20,),
                         Text("Flura and Funa" , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800],fontSize: 20 ),),
                         SizedBox(height: 20,),
                         Container(
                          height: 200,
                        //   child: ListView(
                        //   scrollDirection: Axis.horizontal,
                        //   children: <Widget>[
                        //   makeItem(image: 'assets/images/Andaman.jpg', title: 'Andaman'),
                        //   makeItem(image: 'assets/images/Andaman-and-Nicobar-Islands-6.jpg' , title: 'Nicobar'),
                        //   makeItem(image: 'assets/images/best-places-to-visit-andaman-nicobar-islands.png', title: 'andaman'),
                        //   makeItem(image: 'assets/images/best-places-to-visit-andaman-nicobar-islands.png', title: 'nicobar'),
                        // ],
                        // ),
                        child: StreamBuilder(
                          stream: Firestore.instance.collection('floraandfauna').snapshots(),
                          builder: (context,snapshot){
                            if (!snapshot.hasData)
                              return CircularProgressIndicator();
                            else 
                              return _buildList(snapshot.data.documents);
                          },
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

    
Widget _buildList(listItems){
  
  return   ListView.builder(
      scrollDirection: Axis.horizontal,
      
      //shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context,index){
              return InkWell(

                onTap: (){
                 return Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(listdata: listItems[index])));
                },

           child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  
                  image : NetworkImage(listItems[index].data['z_imagefrontUrl']), 
                  //Image.network(listItems[index].data['z_imagefrontUrl'],fit: BoxFit.cover,),
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
                  child: Text(listItems[index].data['name'], style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
            ),
          ),
        ),
              );
            },
          
  );
}
}


//     Widget makeItem({image, title}) {
//       return AspectRatio(
//         aspectRatio: 1 / 1,
//         child: Container(

//           margin: EdgeInsets.only(right: 15),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             image: DecorationImage(
//               image: AssetImage(image),
//               fit: BoxFit.cover
//             )
//           ),
//           child: Container(
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               gradient: LinearGradient(
//                 begin: Alignment.bottomRight,
//                 colors: [
//                   Colors.black.withOpacity(.8),
//                   Colors.black.withOpacity(.2),
//                 ]
//               )
//             ),
//             child: Align(
//               alignment: Alignment.bottomLeft,
//               child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
//             ),
//           ),
//         ),
//       );
//     }
// }


