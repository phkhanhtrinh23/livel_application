import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/trip_screen/components/each_place.dart';
import 'package:flutter/widgets.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';

import 'components/filter.dart';

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
  String dropdown = 'All';
  String lSearch = '';
  String lField = 'All';
  bool set = false;
  List<String> queryTag=[];
  stt.SpeechToText _speech;
  bool _isListening = false;
  double _confidence = 1.0;

  @override
  initState() {
    super.initState();
    _speech = stt.SpeechToText();
    search.addListener(_onSearchChanged);
    getTag();
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
    getList();
  }

  List<String> cities = [];
  List show = [];
  QuerySnapshot res;

  void callback(List<String> query){
    setState(() {
      this.queryTag = query;

    });
    getTag();
  }
  getList() async {
    List<String> temp = [];
    DocumentSnapshot dictionary = await FirebaseFirestore.instance
        .collection('Dictionary')
        .doc('trip-info')
        .get();
    for (var doc
        in dictionary.get((lField == 'All') ? 'Total' : (lField + 'List'))) {
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
      if (lField == 'All') {
        for (var doc in res.docs) {
          if (doc
                  .get('Place')
                  .toLowerCase()
                  .trim()
                  .contains(search.text.trim()) ||
              doc
                  .get('Country')
                  .toLowerCase()
                  .trim()
                  .contains(search.text.trim()) ||
              doc
                  .get('City')
                  .toLowerCase()
                  .trim()
                  .contains(search.text.trim())) {
            tmp.add(doc);
          }
        }
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
    }
    setState(
      () {
        show = tmp;
      },
    );
  }

  getTag() async {
    List tmp = [];
    for (var doc in res.docs) {
      for (var tag in queryTag) {
        if (doc.get('TagList').contains(tag)) {
          if (tag == queryTag.last) {
            tmp.add(doc);
          }
          continue;
        }
        break;
      }
    }
    setState(
      () {
        if(queryTag.isNotEmpty) show = tmp;
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

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(
            () {
              search.text = val.recognizedWords;
              if (val.hasConfidenceRating && val.confidence > 0) {
                _confidence = val.confidence;
              }
            },
          ),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  bool bePressed = false;

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
                  color: Color(0xFF289CB4),
                ),
                child: Text(
                  'Explore',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
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
                            getList();
                          },
                        );
                      },
                      items: <String>['All', 'Place', 'City', 'Country']
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
                      child: buildCity(),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Color(0xFF289CB4),
                      ),
                      onPressed: () {
                        getSearch();
                      },
                    ),
                    AvatarGlow(
                      animate: _isListening,
                      glowColor: Theme.of(context).primaryColor,
                      endRadius: 20.0,
                      duration: const Duration(milliseconds: 2000),
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      repeat: true,
                      child: IconButton(
                        onPressed: _listen,
                        icon: Icon(
                          _isListening ? Icons.mic : Icons.mic_none,
                          color: Color(0xFF289CB4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 16,
                ),
                alignment: Alignment.center,
                width: 198,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Color(0xFF289CB4),
                ),
                child: TextButton(
                  child: Text(
                    'Filter your trips',
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return PopUpDialog(callback); // !! This is where tag goes
                      },
                    );
                  },
                ),
              ),
              Container(
                height: _height - 353,
                child: show.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: show.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PlaceScreen(
                            image: show[index].get('Thumbnail'),
                            cost: show[index].get('Cost'),
                            date: show[index].get('Date'),
                            place: show[index].get('Place'),
                            list: show[index].get('UserList').length.toString(),
                            id: show[index].id,
                          );
                        },
                      )
                    : set
                        ? Text(
                            "There are no trips!",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
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
            hintStyle: TextStyle(color: Color(0xFF289CB4)),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
        itemBuilder: (context, String suggestion) => ListTile(
          title: Text(suggestion),
        ),
        suggestionsCallback: (query) {
          return getSuggestions(query);
        },
        onSuggestionSelected: (String suggestion) => {
          search.text = suggestion,
        },
        validator: (value) =>
            value != null && value.isEmpty ? 'Please select a city' : null,
        onSaved: (value) => selectedCity = value,
      );

  List<String> getSuggestions(String query) => List.of(cities).where(
        (city) {
          final cityLower = city.toLowerCase();
          final queryLower = query.toLowerCase();

          return cityLower.contains(queryLower);
        },
      ).toList();
}
