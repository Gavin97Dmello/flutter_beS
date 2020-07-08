import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert';
import 'dart:async';

class FeedCard extends StatefulWidget {
  String title, description;
  int interestedCount;
  int index;

  FeedCard(this.title, this.description, this.interestedCount, this.index);

  @override
  FeedCardState createState() {
    print(interestedCount);
    return FeedCardState(title: this.title, description: this.description, interestedCount: this.interestedCount);
  }
}

class FeedCardState extends State<FeedCard> {
  String title, description;
  int interestedCount;
  FeedCardState({this.title, this.description, this.interestedCount});
  @override
  Widget build(BuildContext context) {
    // var decodedTitle = jsonDecode(item)['title'];
    // print(decodedTitle);
    return (Container(
        width: double.infinity,
        margin: EdgeInsets.all(5),
        color: Colors.blue,
        child: Column(children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(children: [
                Container(
                    width: double.infinity,
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'SFProText-Semibold',
                        fontSize: 16,
                      ),
                    )),
                Container(
                    width: double.infinity,
                    child: Text(
                      description,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'SFProText-Regular',
                        fontSize: 13,
                      ),
                    )),
                Row(children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.green,
                      child: Row(children: [
                        Image.asset(
                          'assets/images/like2x.png',
                          width: 20,
                          height: 20,
                        ),
                        Text(
                      interestedCount.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'SFProText-Regular',
                        fontSize: 13,
                      ),),
                      ])),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.red,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.yellow,
                  ),
                ]),
              ])),
          Row(children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.green,
            )),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.yellow,
            )),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.red,
            )),
          ]),
        ])));
  }
}
