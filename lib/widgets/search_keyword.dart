import 'package:flutter/material.dart';
import 'dart:math';

class SearchKeyword extends StatefulWidget {
  const SearchKeyword({super.key, required this.searchKeywords});

  final List<String> searchKeywords;

  @override
  State<SearchKeyword> createState() => _SearchKeywordState();
}

class _SearchKeywordState extends State<SearchKeyword> {

  static List<Color> randomColors = []; 

  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: double.infinity,
      child: ListView.builder(
        itemCount: widget.searchKeywords.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index){
        return Container(
          margin: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 0.0),
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5), child: Row(children: [Text(widget.searchKeywords[index], textAlign: TextAlign.center), const SizedBox(width: 5.0), 
            GestureDetector(
              child: const Icon(Icons.cancel_outlined, size: 16.0),
              onTap: ()=>{
              setState((){
                widget.searchKeywords.removeAt(index);
              })
          },)],
          ),
          decoration: BoxDecoration(
            color: Colors.primaries[widget.searchKeywords[index].hashCode % Colors.primaries.length],
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
            // border: Border.all(width:1.0, color: Colors.black),
          ),
        );
      }),
    );
  }
}