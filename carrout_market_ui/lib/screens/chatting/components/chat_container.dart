import 'package:carrout_market_ui/models/chat_message.dart';
import 'package:carrout_market_ui/screens/components/image_container.dart';
import 'package:carrout_market_ui/theme.dart';
import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    Key? key,
    required this.chatMessage,
  }) : super(key: key);

  // 1. 모델
  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 2. 하단에 구부선 넣기
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            ImageContainer(
              borderRadius: 25,
              imageUrl: chatMessage.profileImage,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  // 4. Text.rich 위젯은 문단 단위로 텍스트를 꾸며 줄 수 있다
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: chatMessage.sender,
                          style: textTheme().bodyText1,
                        ),
                        TextSpan(text: chatMessage.location),
                        TextSpan(text: ' ・${chatMessage.sendDate}'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    chatMessage.message,
                    style: textTheme().bodyText1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Visibility(
              // 5.
              visible: chatMessage.imageUri != null,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageContainer(
                    width: 50,
                    height: 50,
                    borderRadius: 8,
                    imageUrl: chatMessage.imageUri ?? '',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
