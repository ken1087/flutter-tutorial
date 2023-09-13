import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/chat_icon_button.dart';
import 'package:flutter_kakao/components/my_chat.dart';
import 'package:flutter_kakao/components/other_chat.dart';
import 'package:flutter_kakao/components/time_line.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  // 1. 내가 입력한 글을 저장해 둘 리스트
  final List<MyChat> chats = [];
  // 2. 내가 입력한 글을 제어하기 위한 컨트롤러. 이 앱에선 글 입력 후 완료 버튼을 누르면 입력 칸을 비워주기 위해 사용
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFb2c7da),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "홍길동",
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            Icon(FontAwesomeIcons.search, size: 20),
            SizedBox(width: 25),
            Icon(FontAwesomeIcons.bars, size: 20),
            SizedBox(width: 25)
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TimeLine(time: "2023년 2월 5일"),
                      OtherChat(
                        name: "홍길동",
                        text: "새해 복 많이 받으세요",
                        time: "오전 10'10",
                      ),
                      MyChat(text: "선생님도 많이 받으십시오", time: "오후 2:15"),
                      // 3. 이후 만들 채팅 입력 UI를 이용하여 chats에 새 글이 추가되면 화면에 나열해 준다.
                      ...List.generate(chats.length, (index) => chats[index]),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  ChatIconButton(icon: Icon(FontAwesomeIcons.plusSquare)),
                  Expanded(
                    child: Container(
                      child: TextField(
                        // 위에서 미리 작성해둔 컨트롤러. _textController를 이용하면 다른 곳에서 해당 TextField에 접근이 가능
                        controller: _textController,
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        // 글을 입력한 후 완료 버튼을 눌렀을 때 일어나는 이벤트.
                        onSubmitted: _handleSubmitted,
                      ),
                    ),
                  ),
                  ChatIconButton(icon: Icon(FontAwesomeIcons.smile)),
                  ChatIconButton(icon: Icon(FontAwesomeIcons.cog)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(text) {
    // 1. _textController를 이용하여 내가 입력한 글을 비워준다
    _textController.clear();

    // 2. setState를 이용하여 새로 작성한 글을 chats에 추가함과 동시에 화면에 그려지도록 한다
    setState(() {
      chats.add(MyChat(
        text: text,
        // 3. intl 패키지를 이용한 날짜 포맷. 기본적으로 영어만 지원하기 때문에 AM, PM를 한글로 바꿈
        time: DateFormat("a K:m")
            .format(new DateTime.now())
            .replaceAll("AM", "오전")
            .replaceAll("PM", "오후"),
      ));
    });
  }
}
