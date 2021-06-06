import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../components/trip_screen/components/each_place.dart';
import 'package:flutter/widgets.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key key}) : super(key: key);

  @override
  ExploreScreenState createState() => new ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen> {
  ExploreScreenState();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedCity;
  TextEditingController search = new TextEditingController();
  String dropdown = 'Place';
  String lSearch = '';
  String lField = 'Place';
  bool set = false;
  List<String> _options = []; // !!List of Places, Cities, and Countries

  @override
  initState() {
    super.initState();
    search.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    search.removeListener(_onSearchChanged);
    search.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCollection();
  }

  _onSearchChanged() {
    getSearch();
    getList();
  }
  List<String> cities=['Khoa', 'Trinh'];
  List show ;
  QuerySnapshot res;

  getList() async {
    List<String> temp = [];
    DocumentSnapshot dictionary = await FirebaseFirestore.instance
        .collection('Dictionary')
        .doc('trip-info')
        .get();
    for (var doc in dictionary.get('Total')) {
      temp.add(doc);
    }
    setState(
      () {
        cities = temp;
        lSearch = search.text.toLowerCase();
      },
    );
  }

  getSearch() async {
    List tmp = [];
    if (search.text.isEmpty) {
      tmp = res.docs;
    } else {
      for (var doc in res.docs) {
        if (doc
            .get(lField)
            .toString()
            .toLowerCase()
            .trim()
            .contains(search.text.toLowerCase().trim())) {
          tmp.add(doc);
        }
      }
    }
    setState(
      () {
        show = tmp;
      },
    );
  }

  getCollection() async {
    QuerySnapshot data = await FirebaseFirestore.instance
        .collection('Trips')
        .orderBy('Date')
        .get();
    setState(
      () {
        res = data;
        set = true;
      },
    );
    getSearch();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                width: _width,
                height: 148,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: Color(0xFF4EAFC1),
                ),
                child: Text(
                  'Explore',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                ),
                padding: EdgeInsets.all(8.0),
                height: 54,
                width: 330,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                    DropdownButton<String>(
                      value: dropdown,
                      icon: const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Color(0xFF4EAFC1),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                          color: Color(0xFF4EAFC1),
                          fontWeight: FontWeight.bold),
                      underline: Container(
                        height: 0,
                        color: Colors.white,
                      ),
                      onChanged: (String newValue) {
                        setState(
                          () {
                            dropdown = newValue;
                            lField = dropdown;
                            search.clear();
                          },
                        );
                      },
                      items: <String>['Place', 'City', 'Country']
                          .map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                    Expanded(
                       child: buildCity()
                        // child: TextFormField(
                        //   controller: search,
                        //   decoration: InputDecoration(
                        //     fillColor: Colors.white,
                        //     hintText: 'Search',
                        //     hintStyle: TextStyle(color: Colors.black),
                        //     enabledBorder: InputBorder.none,
                        //     focusedBorder: InputBorder.none,
                        //   ),
                        // ),
      ),
                    TextButton(
                      style: TextButton.styleFrom(primary: Color(0xFF4EAFC1)),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: Icon(Icons.search),
                      ),
                      onPressed: () {
                        // if (!_formKey.currentState.validate()) {
                        //   return;
                        // }

                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: _height - 295,
                child: show.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: show.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PlaceScreen(
                            image: show[index].get('Image'),
                            cost: show[index].get('Cost'),
                            date: show[index].get('Date'),
                            place: show[index].get('Place'),
                            list: show[index].get('UserList').length.toString(),
                            id: show[index].id,
                          );
                        },
                      )
                    : set
                        ? Text("There are no trips!")
                        : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildCity() => TypeAheadFormField<String>(
    textFieldConfiguration: TextFieldConfiguration(
        controller: search,
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
    ),
    //suggestionsCallback: ,
    itemBuilder: (context, String suggestion) => ListTile(
      title: Text(suggestion),
    ),
    suggestionsCallback: (query){
      return getSuggestions(query);
    },
    onSuggestionSelected: (String suggestion) =>{
      search.text = suggestion,
    },

    validator: (value) =>
    value != null && value.isEmpty ? 'Please select a city' : null,
    onSaved: (value) => selectedCity = value,
  );
  List<String> getSuggestions(String query) =>
      List.of(cities).where((city) {
        final cityLower = city.toLowerCase();
        final queryLower = query.toLowerCase();

        return cityLower.contains(queryLower);
      }).toList();
}

