import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:async';

class FeedCard extends StatefulWidget {
  Map<String, dynamic> item;
  String title, description;
  int interestedCount;
  int index;
  FeedCard(this.item);

  // FeedCard(this.title, this.description, this.interestedCount, this.index);

  @override
  FeedCardState createState() {
    print('test');
    print(this.item);
    return FeedCardState(item: this.item);

    // return FeedCardState(title: this.title, description: this.description, interestedCount: this.interestedCount);
  }
}

class FeedCardState extends State<FeedCard> {
  Map<String, dynamic> item;
  String title, description;
  int interestedCount;
  FeedCardState({this.item});

  @override
  void initState() {}

  _toggleInterested() {}
  _handleComments() {}
  _handleShare() {}

  // FeedCardState({this.title, this.description, this.interestedCount});
  @override
  Widget build(BuildContext context) {
    // var decodedTitle = jsonDecode(item)['title'];
    // print(item["title"]);
    return (Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)],
        ),
        child: Column(children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0),

                // boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)],
              ),
              child: Column(children: [
                Container(
                    width: double.infinity,
                    child: Text(
                      item['title'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'SFProText-Semibold',
                        fontSize: 16,
                      ),
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/images/moreOptions.png',
                        width: 20,
                        height: 20,
                      )),
                ]),
                Container(
                  width: double.infinity,
                  child: ParsedText(
                      alignment: TextAlign.start,
                      selectable: true,
                      text:
                          item['description'],
                      parse: <MatchText>[
                        /* MatchText(
                    type: ParsedType.EMAIL,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                    ),
                    onTap: (url) {
                      launch("mailto:" + url);
                    }),
                MatchText(
                    type: ParsedType.URL,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                    ),
                    onTap: (url) async {
                      var a = await canLaunch(url);

                      if (a) {
                        launch(url);
                      }
                    }),
                MatchText(
                    type: ParsedType.PHONE,
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 24,
                    ),
                    onTap: (url) {
                      launch("tel:" + url);
                    }),
                MatchText(
                    pattern: r"\[(@[^:]+):([^\]]+)\]",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                    ),
                    renderText: ({String str, String pattern}) {
                      Map<String, String> map = Map<String, String>();
                      RegExp customRegExp = RegExp(pattern);
                      Match match = customRegExp.firstMatch(str);
                      map['display'] = match.group(1);
                      map['value'] = match.group(2);
                      return map;
                    },
                    onTap: (url) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Mentions clicked"),
                            content: new Text("$url clicked."),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {},
                              ),
                            ],
                          );
                        },
                      );
                    }),
                    */
                MatchText(
                    pattern: r"\B#+([\w]+)\b",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 13,
                    ),
                   ),
                 
                       /* MatchText(
                            pattern: r"\(b\)([a-z|A-Z|\s]+)\(b\)",
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 24,
                            ),
                            regexOptions: RegexOptions(
                                multiLine: true,
                                caseSensitive: false,
                                unicode: true,
                                dotAll: true),
                            onTap: (url) async {})
                            */
                      ],
                      style: TextStyle(
                        fontFamily: 'SFProText-Regular',
                        fontSize: 13,
                        color: Colors.black,
                      )),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  RaisedButton(
                        onPressed: _toggleInterested,
                        padding: EdgeInsets.all(2),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Text(
                    'See more',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'SFProText-Semibold',
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ))
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                          color: Colors.white,
                          child: Row(children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                child: Image.asset(
                                  'assets/images/like2x.png',
                                  width: 20,
                                  height: 20,
                                )),
                            Text(
                              item['interested_count'].toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'SFProText-Regular',
                                fontSize: 13,
                                                      color: Colors.grey[600],

                              ),
                            ),
                          ])),
                      Container(
                          padding: EdgeInsets.all(5),
                          // color: Colors.green,
                          child: Row(children: [
                            Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  'assets/images/comment2x.png',
                                  width: 20,
                                  height: 20,
                                )),
                            Text(
                              item['comments_count'].toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'SFProText-Regular',
                                fontSize: 13,
                                                      color: Colors.grey[600],

                              ),
                            ),
                          ])),
                      Container(
                          padding: EdgeInsets.all(5),
                          // color: Colors.green,
                          child: Row(children: [
                            Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  'assets/images/upload2x.png',
                                  width: 20,
                                  height: 20,
                                )),
                            Text(
                              item['comments_count'].toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'SFProText-Regular',
                                fontSize: 13,
                                                      color: Colors.grey[600],

                              ),
                            ),
                          ])),
                      Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          // color: Colors.green,
                          child: Row(children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                                child: Image.asset(
                                  'assets/images/likeBlue.png',
                                  width: 15,
                                  height: 15,
                                )),
                            Text(
                              item['interested_count_from_school'].toString() +
                                  " in my school",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'SFProText-Regular',
                                fontSize: 13,
                                                      color: Colors.grey[600],

                              ),
                            ),
                          ])),
                    ]),
              ])),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: double.infinity,
            padding: EdgeInsets.only(top: 0.3),
            color: Colors.black,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                        onPressed: _toggleInterested,
                        padding: EdgeInsets.all(5),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Row(children: [
                          Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/like1x.png',
                                width: 25,
                                height: 25,
                              )),
                          Text(
                            "Interested",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'SFProText-SemiBold',
                              fontSize: 13,
                            ),
                          ),
                        ])),
                    RaisedButton(
                        onPressed: _handleComments,
                        padding: EdgeInsets.all(5),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Row(children: [
                          Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/comment1x.png',
                                width: 28,
                                height: 28,
                              )),
                          Text(
                            'Comment',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'SFProText-SemiBold',
                              fontSize: 13,
                            ),
                          ),
                        ])),
                    RaisedButton(
                        onPressed: _handleShare,
                        padding: EdgeInsets.all(5),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Row(children: [
                          Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/upload1x.png',
                                width: 30,
                                height: 30,
                              )),
                          Text(
                            'Share',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'SFProText-SemiBold',
                              fontSize: 13,
                            ),
                          ),
                        ])),
                  ])),
        ])));
  }
}
