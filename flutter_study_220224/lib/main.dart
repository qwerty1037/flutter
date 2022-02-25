import 'package:flutter/material.dart';
import 'list.dart';
import 'package:korea_regexp/get_regexp.dart';
import 'package:korea_regexp/models/regexp_options.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Searchbar",
      home: SearchBar(),
    );
  }
}
class SearchBar extends StatefulWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  
  final TextEditingController _filter = new TextEditingController(); // 필터 역할을 한다, but 정확한 쓰임새를 모르겠다..

  String _searchText = ""; //얘도 아직 쓰임새를 모르겠다

  List names = []; // dataclass.name 리스트

  List filteredNames = []; // searchtext에 의해 필터링된 name

  Icon _searchIcon = Icon(Icons.search); //뭔지 모르겠다.. 검색 아이콘의 단축어?

  Widget _appBarTitle = Text('Search Example'); // Search Example의 단축어?


  //리스트를 변수로 가져오는 함수
  void _getNames () async {
    // TODO: dataclass에서 list를 뽑는 코드가 추가되어야 함
    setState(() {
      names = datalist;
      filteredNames = datalist;
    });
  }

  void _searchPressed() {
    setState(() {
      if(_searchIcon.icon == Icons.search) { //off->on
        _searchIcon = Icon(Icons.close);
        _appBarTitle = TextField(
          controller: _filter,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search...'
          ),
        );
      }
      else { //on->off
        _searchIcon = Icon(Icons.search);
        _appBarTitle = Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  _SearchBarState(){
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      }
      else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState(){
    _getNames();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  Widget _buildList () {
    if (!(_searchText.isEmpty)) { //무언가를 입력했다면
      List tempList = [];
      RegExp regExp = getRegExp(
        _searchText,
        RegExpOptions(
          initialSearch: true,
          startsWith: false,
          endsWith: false,
          fuzzy: true,
          ignoreSpace: true,
          ignoreCase: true,
        )
      );
      for (int i=0;i<filteredNames.length;i++) {
        if(regExp.hasMatch(filteredNames[i])) { //입력한 문자와 일치하는 검색 결과 필터
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(filteredNames[index]),
          // ignore: avoid_print
          onTap: () => print(filteredNames[index]),
        );
      },
    );
  }


}




