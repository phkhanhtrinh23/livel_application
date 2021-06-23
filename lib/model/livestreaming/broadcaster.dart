import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_application/model/database/addCode.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/model/livestreaming/host.dart';

class AddCodePage extends StatefulWidget {
  final String id, channel;
  AddCodePage(this.id, this.channel);
  @override
  _AddCodePage createState() => _AddCodePage(this.id, channel);
}

class _AddCodePage extends State<AddCodePage> {
  final String id, channel;
  _AddCodePage(this.id, this.channel);

  final _channelController = TextEditingController();
  bool _validateError = false;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: _width,
            height: 148,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Color(0xFF289CB4),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  'Livel',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 48,
                  bottom: 32,
                ),
                padding: EdgeInsets.all(8.0),
                height: 54,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: TextField(
                  controller: _channelController,
                  decoration: InputDecoration(
                    errorText:
                        _validateError ? 'Channel name is mandatory' : null,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    hintText: 'Your channel name',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              FutureBuilder(
                future: getName(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      width: 213,
                      height: 51,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color(0xFF289CB4),
                      ),
                      child: TextButton(
                        onPressed: () {
                          addCode(
                              this.id,
                              this
                                  ._channelController
                                  .text
                                  .trim()
                                  .toLowerCase());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BroadcastPage(
                                channelName: _channelController.text,
                                userName: snapshot.data.get('Name'),
                                isBroadcaster: true,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Create',
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
