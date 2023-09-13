import 'package:flutter/material.dart';
import 'package:market_kurly_ui/constants.dart';
import 'package:market_kurly_ui/screens/components/CustomActions.dart';
import 'package:market_kurly_ui/screens/search/components/defualt_search_field.dart';

class SearchScreen extends StatelessWidget {
  // 1. ListView.separated 위젯 안에 사용될 텍스트 위젯의 샘플 데이터
  final List searchKeyword = ["불고기", "닭갈비", "삼겹살", "갈비곰탕", "생새우살"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("검색"),
        actions: [CustomActions()],
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          // 1.
          // DefaultSearchField
          DefaultSearchField(),
          const SizedBox(height: 20),
          Text(
            "인기 검색어",
            style: TextStyle(color: kTextColor),
          ),
          // 2.
          // ListView.separated
          // Container위젯의 height값을 400으로 지정
          // ListView.separated의 영역, 스크롤 가능 영역의 크기를 정의해서 사용
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 400,
            child: ListView.separated(
                itemBuilder: (context, index) => Container(
                      child: SizedBox(
                        height: 50,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            searchKeyword[index],
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => Divider(
                      thickness: 0.5,
                      height: 0,
                    ),
                itemCount: searchKeyword.length),
          )
        ],
      ),
    );
  }
}
