import 'package:flutter/material.dart';
import '../../components/FeedCard.dart';
import '../../services/ApiProvider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';


class CardDetail extends StatefulWidget {
  String id;

  CardDetail(
    this.id,
  );
  @override
  State<StatefulWidget> createState() {
    return CardDetailState(this.id);
  }
}

class CardDetailState extends State<CardDetail> {
  String _id;
  Map<String, dynamic> _item;
  // int index;
  int _current = 0;
  bool loading= false;

  CardDetailState(this._id);

  @override
  void initState() {

    _getFeedDetails();
  }

  void _getFeedDetails() async {
    ApiProvider _provider = ApiProvider();
    _provider.getAdventure(_id).then((response)async {
// print('Card Details  api success');
      // print(response);
      setState(() {
        _item = response;
        loading = true;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    List imageList, subjectList;
    final List<String> imageArray = [];
               FlutterStatusbarManager.setHidden(true);

    if (loading == true) {
      imageList = _item['images_details'] as List;
      subjectList = _item["subject_details"] as List;
      if (imageList != [null] && imageList.length > 0) {
        for (var i = 0; i < imageList.length; i++) {
          imageArray.add(imageList[i]["path"]);
        }
      }
      if (imageArray.length == 0 &&
          subjectList != null &&
          subjectList.length > 0) {
        imageArray.add(imageList[0]["path"]);
      }
    }

    double width = MediaQuery.of(context).size.width;

    double yourWidth = width;
    double yourHeight = (width) * 2 / 3;
    return MaterialApp(
        home: Scaffold(
            body: loading == false
                ? GFLoader()
                : Container(
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
                        // margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(children: [
                          imageArray.length > 1
                              ? CarouselSlider(
                                  items: imageArray
                                      .map((item) => Container(
                                            child: GFImageOverlay(
                                                height: yourHeight,
                                                width: yourWidth,
                                                image: NetworkImage(item)),
                                            color: Colors.white,
                                          ))
                                      .toList(),
                                  options: CarouselOptions(
                                      height: yourHeight,
                                      viewportFraction: 1.0,
                                      enlargeCenterPage: false,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _current = index;
                                        });
                                      }),
                                )
                              // Image.asset('assets/images/noImage.png',  width: 400, height: 200)
                              : GFImageOverlay(
                                  height: yourHeight,
                                  width: yourWidth,
                                  image:
                                      AssetImage('assets/images/noImage.png')),
                          imageArray.length > 1
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: imageArray.map((url) {
                                    int index = imageArray.indexOf(url);
                                    return Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _current == index
                                            ? Color.fromRGBO(6, 102, 169, 1)
                                            : Color.fromRGBO(0, 0, 0, 0.4),
                                      ),
                                    );
                                  }).toList(),
                                )
                              : Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: 10),
                                ),
                        ]),
                      )
                    ]))));
  }
}
