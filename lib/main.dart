import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SearchView(),
  ));
}

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      drawer: Drawer(),
    );
  }
}


class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Taraz",
    "Almaty",
    "Shymkent",
    "Astana",
    "Karaganda",
    "Kokshetau",
  ];

  final recentCities = [
    "Karaganda",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the selection
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionsList = query.isEmpty? recentCities: cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        title: Text(suggestionsList[index]),
      ),
      itemCount: suggestionsList.length
    );
  }

}