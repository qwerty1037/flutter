import 'package:flutter/material.dart';
import 'list.dart';
import 'package:korea_regexp/get_regexp.dart';
import 'package:korea_regexp/models/regexp_options.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _filter = new TextEditingController();

  String _searchText = ""; // 검색창에 user가 타이핑한 문자열

  List totalList = []; // 전체 리스트

  List filteredList = []; // searchtext에 의해 필터링된 리스트

  Icon _searchIcon = Icon(Icons.search); // 검색 아이콘

  Widget _appBarTitle = Text('Search Example'); // Search Example의 단축어?

  //리스트를 변수로 가져오는 함수
  void getLectureName() async {
    setState(() {
      totalList = datalist;
      filteredList = datalist;
    });
  }

  _SearchScreenState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredList = totalList;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    getLectureName();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _appBarTitle,
        leading: IconButton(
          icon: _searchIcon,
          onPressed: () {
            if (whenSearchBarActivated()) {
              activateSearchBar();
            } else {
              deactivateSearchBar();
            }
          },
        ),
      ),
      body: Container(
        child: _buildList(),
      ),
    );
  }

  bool whenSearchBarActivated() {
    if (_searchIcon.icon == Icons.search) {
      return true;
    } else {
      return false;
    }
  }

  void activateSearchBar() {
    _searchIcon = Icon(Icons.close);
    _appBarTitle = TextField(
      controller: _filter,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search), hintText: 'Search...'),
    );
  }

  void deactivateSearchBar() {
    _searchIcon = Icon(Icons.search);
    _appBarTitle = Text('Search Example');
    filteredList = totalList;
    _filter.clear();
  }

  Widget _buildList() {
    if (_searchText.isNotEmpty) {
      filteredList = filterTotalListBySearchText();
    }
    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(filteredList[index]),
          // ignore: avoid_print
          onTap: () => print(filteredList[index]),
        );
      },
    );
  }

  List filterTotalListBySearchText() {
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
      ),
    );
    for (int i = 0; i < totalList.length; i++) {
      if (regExp.hasMatch(totalList[i])) {
        //입력한 문자와 일치하는 검색 결과 필터
        tempList.add(totalList[i]);
      }
    }
    return tempList;
  }
}
