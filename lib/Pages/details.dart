import 'package:andaman_nicbar_island/Pages/browser.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  final  listdata;
  Details({Key key ,@required this.listdata}):super(key:key);
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   leading: IconButton(
      //     onPressed: (){
      //       return Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.arrow_back),
      //   ),
      // ),
      //start your code here
    body: Container(
      width: double.infinity,
        decoration: BoxDecoration(
           image: DecorationImage(
             image: NetworkImage(widget.listdata.data['z_imagedetailUrl']),
             fit: BoxFit.cover
           )
        ),
       child: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
             begin: Alignment.bottomRight,
             colors: [
               Colors.black.withOpacity(.9),
               Colors.black.withOpacity(.3),
             ]
          )
         ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    return Navigator.pop(context,);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                    ),
                ),
                SizedBox(
                  height: 300.0,
                ),
                Text(widget.listdata.data['name'] , style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                Text(widget.listdata.data['description'], style: TextStyle(color: Colors.white,fontSize: 20,),),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: () => launchURL(context,widget.listdata.data['vrlink']),
                      child: Center(
                      child: Text("Enter for 360 mode",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                SizedBox(height: 50,)
              ],
            ),
          )
       ),
    ),
    );
  }
}