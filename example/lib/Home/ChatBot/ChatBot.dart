import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';
import '../../Utils/ColorFile.dart';
import '../utils/UtilsWidgets.dart';
import '../widgets/widgets.dart';

class ChatBot1 extends StatefulWidget {
  const ChatBot1({super.key});

  @override
  State<ChatBot1> createState() => _ChatBot1State();
}

class _ChatBot1State extends State<ChatBot1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          color: Colors.white,
        ),
        title: Row(
          children: [
            Text(
              "Chat",
              style: TextStyle(color: primary, fontWeight: FontWeight.bold),
            ),
            Text(
              "Bot",
              style: TextStyle(color: primary1, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: ChatBot(),
    );
  }
}

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late DialogFlowtter dialogFlowtter;
  late List<Map<String, dynamic>> msg = [];
  late TextEditingController textEditingController = TextEditingController();
  late bool isDevice;
  late double width;
  late double height;

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    isDevice = getData(width) == "xs" || getData(width) == "sm";
    return Container(
      color: bgClr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //CHAT
          Expanded(
            child: FB5Col(
              child: ListView.separated(
                reverse: true,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var obj = msg[msg.length - 1 - index];
                  Message message = obj['msg'];
                  bool isUser = obj['isUser'];
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: FB5Row(
                      classNames: isUser
                          ? 'justify-content-end'
                          : 'justify-content-start',
                      children: [
                        FB5Col(
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 250),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: isUser ? primary : Colors.grey),
                            child: Text(
                              message.text?.text?[0] ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Container(
                  height: 10,
                ),
                itemCount: msg.length,
              ),
            ),
          ),
          //TEXT FIELD
          FB5Col(
            classNames: 'm-1',
            child: Container(
              color: Colors.white,
              child: TextField(
                textInputAction: TextInputAction.send,
                decoration: InputDecoration(
                    labelText: "Type a Message",
                    labelStyle: TextStyle(color: textFieldClr),
                    suffixIcon: IconButton(
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          String text = textEditingController.text;
                          textEditingController.text = "";
                          if (text.trim().isNotEmpty) {
                            addMsg(
                                Message(
                                    text: DialogText(text: [text.toString()])),
                                true);

                            DetectIntentResponse res =
                                await dialogFlowtter.detectIntent(
                                    queryInput: QueryInput(
                                        text: TextInput(text: text)));
                            if (res.message != null) {
                              addMsg(res.message!, false);
                            }
                          }
                        },
                        icon: Icon(
                          Icons.send,
                          color: primary,
                        )),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: textFieldClr)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: textFieldClr))),
                controller: textEditingController,
              ),
            ),
          )
        ],
      ),
    );
  }

  addMsg(Message message, bool isUser) {
    setState(() {
      msg.add({'msg': message, 'isUser': isUser});
    });
  }
}
