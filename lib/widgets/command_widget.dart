import 'package:flutter/material.dart';
import 'package:mobis/widgets/search_keyword.dart';
import 'package:mobis/widgets/search_results.dart';

class CommandWidget extends StatefulWidget {
  const CommandWidget({super.key, required this.onClick});
  
  final Function(int) onClick;

  @override
  State<CommandWidget> createState() => _CommandWidgetState();
}

class _CommandWidgetState extends State<CommandWidget> {
  List<String> searchKeywords = ["서울", "사고", "사거리", "용산구"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(children: [
        // Search Input
        TextField(decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search',
        ),
        textInputAction: TextInputAction.go,
        onSubmitted: (value){
          setState(() {
            searchKeywords.add(value);
          });
        },
      ),
      SearchKeyword(searchKeywords: searchKeywords),
      SearchResults(searchKeywords: searchKeywords, onClick: widget.onClick,),
      ]),
      );
  }
}