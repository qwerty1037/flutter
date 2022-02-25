import 'package:flutter/material.dart';
import 'search.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
/*

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController(); //검색 위젯을 컨트롤하는 위젯
  FocusNode focusNode = FocusNode(); // 검색 위젯의 상태를 가지는 위젯
  String _searchText = ""; //변수
  Future<snapshot> futureSearchResults;

  _SearchScreenState(){
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text; // _filter가 변화를 감지, _searchText의 상태 변화
      });
    });
  }
  
  Widget _buildbody(BuildContext context) {
    return FutureBuilder(
        future: Firestore.instance.collection('movie').snapshots(),
        builder: (context, snapshot){

        }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(30)
            ),
            Container(
              color: Colors.black,
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: TextField(
                      focusNode: focusNode,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      autofocus: true,
                      controller: _filter,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white60,
                          size: 20,
                        ),
                        suffixIcon: focusNode.hasFocus //suffixIcon: 우측에 배치될 아이콘
                            ? IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  size: 20,
                                ),
                                onPressed: (){
                                  setState(() {
                                    _filter.clear();
                                    _searchText = "";
                                  });
                                },
                              )
                            : Container(),
                        hintText: '검색',
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  focusNode.hasFocus
                    ? Expanded(
                        child: FlatButton(
                          child: Text(
                            '취소',
                            style: TextStyle(color: Colors.white,fontSize: 13),
                          ),
                          onPressed: () {
                            setState(() {
                              _filter.clear();
                              _searchText = "";
                              focusNode.unfocus();
                            });
                          }
                        ),
                      )
                    : Expanded(
                        flex: 0,
                        child: Container(),
                      )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/