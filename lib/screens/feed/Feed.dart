import 'package:flutter/material.dart';
import '../../components/FeedCard.dart';
import '../../services/ApiProvider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';


class Feed extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return FeedState();
  }
}
class FeedState extends State<Feed> {

var _offset = 0;
List<dynamic> _feedList =[];
  @override
  void initState() {
    _getFeeds();   
  }

  void _getFeeds() async {
    ApiProvider _provider = ApiProvider();
    _provider.getFeeds({'offset':_offset.toString(), 'limit': '10', "feed": true.toString() ,
      "interested": false.toString(),
      "in_progress": false.toString(),
      "done": false.toString(),
      "can_guide": false.toString(),
      "created": false.toString(),}).then((response) {
                // print(response); 

          // print(response['results']); 
          setState(() {
            _feedList = response['results'];
            _offset = _offset + 10;
          });
    });
  }

  _goToCardDetails(id) {
    print('navigation working');
     Navigator.of(context).pushNamed( '/CardDetail', arguments: id );
  }
  
  @override
  Widget build(BuildContext context) {
                   FlutterStatusbarManager.setHidden(false);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Text('beSomeone')

          
        ),
        body: _feedList.length ==0?GFLoader():ListView.builder(
          itemCount:_feedList.length,
          itemBuilder: (BuildContext context, int index) {
            // print(_feedList[index]['title']);
                        return FeedCard(_feedList[index], _goToCardDetails);

            // return FeedCard(_feedList[index]['title'],_feedList[index]['description'],_feedList[index]['interested_count'] , index);
          })
      )
    );
  }
}