

import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      
    );
  }
}

class DataSearch extends SearchDelegate<String>{

 List name = [
   "Aberdeen Heritage Walk",
  "Balidan Vedi",
  "Cellular Jail",
  "Chatham Island",
  "Param Vir Chakra Memorial",
  "Viper Island",
  "Chidiyatapu Beach",
  "Jolly Bujoy",
  "Ramnagar Beach",
  "Ross & Smith Island",
  "Sitapur Beach",
 ];
 List recentname =[
   "Balidan Vedi",
  "Cellular Jail",
  "Chatham Island",
 ];



  @override
  List<Widget> buildActions(BuildContext context) {
    //actions foe app bar 
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query ="";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty?recentname:name.where((p)=>p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length ,

    );
  }

}