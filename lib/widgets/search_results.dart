import 'package:flutter/material.dart';
import 'package:mobis/functions/mobis_api_caller.dart';
import 'package:mobis/functions/pausable_timer.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key, required this.searchKeywords, required this.onClick});

  final Function(int) onClick;
  final List<String> searchKeywords;
  
  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {

  static const intervalSeconds = 1;
  static PausableTimer _actionTimer = PausableTimer(const Duration(seconds: intervalSeconds), (){});
  
  List<dynamic> _results = [
    {
      "id": 1,
      "title": "서울, 용산구, 한남동",
      "subtitle":"서울 용산구 한남동에서 사거리에서 자동차 사고가 발생했습니다."
    },
    {
      "id": 2,
      "title": "서울, 용산구, 동부이촌동",
      "subtitle": "서울 용산구 동부이촌동에서 사거리에서 트럭과 소형차 사이의 접촉사고가 발생했습니다."
    },
    {
      "id": 3,
      "title": "서울, 용산구, 한남동",
      "subtitle":"서울 용산구 한남동에서 사거리에서 자동차 사고가 발생했습니다."
    },
    {
      "id": 4,
      "title": "서울, 용산구, 이태원동",
      "subtitle": "서울 용산구 이태원동서 사거리에서 자동차 사고가 발생했습니다."
    },
    {
      "id": 5,
      "title": "서울, 용산구, 한남동",
      "subtitle":"서울 용산구 한남도에서 사거리에서 자동차 사고가 발생했습니다."
    },
    {
      "id": 6,
      "title": "서울, 용산구, 공덕동",
      "subtitle": "서울 용산구 공덕동에서 사거리에서 오토바이와 중형차 사이의 접촉사고가 발생했습니다."
    },
    {
      "id": 7,
      "title": "서울, 용산구, 한강철교",
      "subtitle":"서울 용산구 한강철교에서 사거리에서 자동차 두대 추돌사고가 발생했습니다."
    },
    {
      "id": 8,
      "title": "서울, 용산구, 한남동",
      "subtitle": "서울 용산구 한남도에서 사거리에서 자동차 사고가 발생했습니다."
    },
  ];

  @override
  void initState(){
    super.initState();
    // _actionTimer = PausableTimer(const Duration(seconds: intervalSeconds), (){
    //   MobisApiCaller.getListByQueries(widget.searchKeywords).then((results){
    //     setState((){
    //       _results.add(results["results"]);
    //     });
    //   });
    // });
  }

  @override
  void dispose(){
    _actionTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _results.length,
        itemBuilder: (c, i) { 
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: GestureDetector(
              child: ListTile(
                title: Text(_results[i]["title"]),
                subtitle: Text(_results[i]["subtitle"]),
              ),
              onTap: ()=>widget.onClick(i)
            )
          );
        },

      ),
    );
  }
}